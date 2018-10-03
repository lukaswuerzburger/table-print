//
//  TPTablePrint.swift
//  truffls-ios-app
//
//  Created by Lukas Würzburger on 6/12/18.
//  Copyright © 2018 Lukas Würzburger. All rights reserved.
//

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

    open func printTable(_ content: [AnyHashable : Any?]) {
        let stringifiedContent = stringified(content)
        let keys = stringifiedContent.keys.map({ String(describing: $0) })
        let values = stringifiedContent.values.map({ String($0) })
        let keyWidth = maxKeyWidth(keys: keys)
        let valueWidth = maxValueWidth(values: values)
        var lines: [String] = []
        let line = separatorLine(keyWidth: keyWidth, valueWidth: valueWidth)
        lines.append(line)
        let pair: (String, String) = (key: configuration.keyTitle, value: configuration.valueTitle)
        let widths = (key: keyWidth, value: valueWidth)
        let headline = lineWithPair(pair, widths: widths)
        lines.append(headline)
        lines.append(line)
        for pair in stringifiedContent {
            let line = lineWithPair(pair, widths: widths)
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

    private func lineWithPair(_ pair: (key: String, value: String), widths: (key: Int, value: Int)) -> String {
        let numberOfExtraKeySpace = (widths.key - pair.key.count)
        let extraKeySpaces = repeatChar(" ", count: numberOfExtraKeySpace)
        let valueString = pair.value
        let numberOfExtraValueSpace = (widths.value - valueString.count)
        let extraValueSpaces = repeatChar(" ", count: numberOfExtraValueSpace)
        let line = "\(configuration.verticalLineSymbol) \(pair.key)\(extraKeySpaces) \(configuration.verticalLineSymbol) \(valueString)\(extraValueSpaces) \(configuration.verticalLineSymbol)"
        return line
    }

    private func repeatChar(_ char: String, count: Int) -> String {
        var str: String = ""
        for _ in 0..<count {
            str += char
        }
        return str
    }
}
