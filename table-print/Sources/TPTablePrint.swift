import Foundation

open class TPTablePrint {

    // MARK: - Variables

    open var configuration: TPConfiguration
    open var printer: TPPrinter

    // MARK: - Initializer

    init(configuration: TPConfiguration = .shared, printer: TPPrinter = TPConsolePrinter()) {
        self.configuration = configuration
        self.printer = printer
    }

    // MARK: - Public functions

    open func printTable(_ content: [AnyHashable : Any?], sorting: Sorting? = nil) {

        let stringifiedContent = stringified(content)
        let keys = stringifiedContent.keys.map({ String(describing: $0) })
        let values = stringifiedContent.values.map({ String($0) })
        let keyWidth = maxKeyWidth(keys: keys)
        var valueWidth = maxValueWidth(values: values)

        if let maxWidth = configuration.maxWidth {
            let keyAndSeparatorWidth = keyWidth + 4 * configuration.padding + 3 * configuration.verticalLineSymbol.count
            let lineLength = keyAndSeparatorWidth + valueWidth
            if lineLength > maxWidth {
                valueWidth = maxWidth - keyAndSeparatorWidth
            }
        }

        var lines: [String] = []
        let line = separatorLine(keyWidth: keyWidth, valueWidth: valueWidth)
        lines.append(line)
        let pair: (String, String) = (key: configuration.keyTitle, value: configuration.valueTitle)
        let widths = (key: keyWidth, value: valueWidth)
        let headline = self.line(key: pair.0, value: pair.1, widths: widths)
        lines.append(headline)
        lines.append(line)

        let orderedKeys: [String]
        switch sorting {
        case .none:
            orderedKeys = keys
        case .key(let direction):
            orderedKeys = keys.sorted(by: direction == .ascending ? ascending : descending)
        case .value(let direction):
            orderedKeys = keys.sorted(by: { lhs, rhs in
                if direction == .ascending {
                    stringifiedContent[lhs]! > stringifiedContent[rhs]!
                } else {
                    stringifiedContent[lhs]! < stringifiedContent[rhs]!
                }
            })
        }

        for key in orderedKeys {
            let line = self.line(key: key, value: stringifiedContent[key]!, widths: widths)
            lines.append(line)
        }
        lines.append(line)
        printer.printString(lines.joined(separator: "\n"))
    }

    private func stringified(_ content: [AnyHashable : Any?]) -> [String : String] {
        var iterator = content.makeIterator()
        var stringifiedContent: [String : String] = [:]
        while let pair = iterator.next() {
            let key = String(describing: pair.key)
            let value = String(describing: pair.value ?? configuration.placeholder)
            stringifiedContent[key] = value
        }
        return stringifiedContent
    }

    private func separatorLine(keyWidth: Int, valueWidth: Int) -> String {
        return configuration.edgeSymbol
        + repeatChar(configuration.horizontalLineSymbol, count: keyWidth + 2 * configuration.padding)
        + configuration.edgeSymbol
        + repeatChar(configuration.horizontalLineSymbol, count: valueWidth + 2 * configuration.padding)
        + configuration.edgeSymbol
    }

    private func maxKeyWidth(keys: [String]) -> Int {
        var contentKeys = keys
        contentKeys.append(configuration.keyTitle)
        let width = contentKeys.map({ $0.count }).max() ?? 0
        return width
    }

    private func maxValueWidth(values: [String?]) -> Int {
        var contentValues = values.map({ $0 ?? configuration.placeholder })
        contentValues.append(configuration.valueTitle)
        let width = contentValues.map({ $0.count }).max() ?? 0
        return width
    }

    private func line(key: String, value: String, widths: (key: Int, value: Int)) -> String {
        let numberOfExtraKeySpace = (widths.key - key.count)
        let extraKeySpaces = repeatChar(" ", count: numberOfExtraKeySpace)
        let paddingSpace = repeatChar(" ", count: configuration.padding)

        var result = configuration.verticalLineSymbol
            + paddingSpace
            + key
            + extraKeySpaces
            + paddingSpace
            + configuration.verticalLineSymbol
            + paddingSpace

        let lineEnd = paddingSpace + configuration.verticalLineSymbol
            + "\n"
            + configuration.verticalLineSymbol
            + repeatChar(" ", count: widths.key + 2 * configuration.padding)
            + configuration.verticalLineSymbol
            + paddingSpace

        result += breakLines(value, lineLength: widths.value, lineEnd: lineEnd)

        return result
    }

    private func breakLines(_ string: String, lineLength: Int, lineEnd: String) -> String {
        var result = ""

        var rest = Substring(string)
        var currentLineLength = 0
        while !rest.isEmpty {
            let breakIndex = rest.firstIndex { $0.isWhitespace } ?? rest.endIndex
            let count = rest.distance(from: rest.startIndex, to: breakIndex)

            if currentLineLength == 0 && count > lineLength {
                result += rest.prefix(lineLength)
                result += lineEnd

                rest = rest.dropFirst(lineLength)
            } else if currentLineLength + count > lineLength {
                result += repeatChar(" ", count: lineLength - currentLineLength)
                result += lineEnd

                currentLineLength = 0
            } else {
                currentLineLength += count + 1
                result += rest.prefix(upTo: breakIndex)
                result += " "
                rest = rest.suffix(from: breakIndex)
                rest = rest.drop(while: { $0.isWhitespace })
            }
        }

        result += repeatChar(" ", count: configuration.padding + lineLength - currentLineLength)
            + configuration.verticalLineSymbol

        return result

    }

    private func repeatChar(_ char: String, count: Int) -> String {
        return String(repeating: char, count: count)
    }

    private func ascending<T: Comparable>(lhs: T, rhs: T) -> Bool {
        lhs > rhs
    }

    private func descending<T: Comparable>(lhs: T, rhs: T) -> Bool {
        lhs < rhs
    }
}
