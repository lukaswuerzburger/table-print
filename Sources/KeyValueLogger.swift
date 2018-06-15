//
//  KeyValueLogger.swift
//  truffls-ios-app
//
//  Created by Lukas Würzburger on 6/12/18.
//  Copyright © 2018 Lukas Würzburger. All rights reserved.
//

import Foundation

public class KeyValueLogger {

    // MARK: - Variables

    var margin = 1

    let keyTitle = "Key"
    let valueTitle = "Value"
    let edgeSymbol = "+"
    let horizontalLineSymbol = "-"
    let verticalLineSymbol = "|"

    let placeholder = "<nil>"

    // MARK: - Public functions

    func log(_ content: [String : String?]) {
        let keys = content.keys.map({ String($0) })
        let values = content.values.compactMap({ String($0 ?? placeholder) })
        let keyWidth = maxKeyWidth(keys: keys)
        let valueWidth = maxValueWidth(values: values)
        let line = separatorLine(keyWidth: keyWidth, valueWidth: valueWidth)
        print(line)
        let pair: (String, String?) = (key: keyTitle, value: valueTitle)
        let widths = (key: keyWidth, value: valueWidth)
        let headline = lineWithPair(pair, widths: widths)
        print(headline)
        print(line)
        for pair in content {
            let line = lineWithPair(pair, widths: widths)
            print(line)
        }
        print(line)
    }

    func separatorLine(keyWidth: Int, valueWidth: Int) -> String {
        return edgeSymbol
        + repeatChar(horizontalLineSymbol, count: keyWidth + 2 * margin)
        + edgeSymbol
        + repeatChar(horizontalLineSymbol, count: valueWidth + 2 * margin)
        + edgeSymbol
    }

    func maxKeyWidth(keys: [String]) -> Int {
        var contentKeys = keys
        contentKeys.append(keyTitle)
        let width = contentKeys.map({ $0.count }).max() ?? 0
        return width
    }

    func maxValueWidth(values: [String?]) -> Int {
        var contentValues = values.map({ $0 ?? placeholder })
        contentValues.append(valueTitle)
        let width = contentValues.map({ $0.count }).max() ?? 0
        return width
    }

    func lineWithPair(_ pair: (key: String, value: String?), widths: (key: Int, value: Int)) -> String {
        let numberOfExtraKeySpace = (widths.key - pair.key.count)
        let extraKeySpaces = repeatChar(" ", count: numberOfExtraKeySpace)
        let valueString = (pair.value ?? placeholder)
        let numberOfExtraValueSpace = (widths.value - valueString.count)
        let extraValueSpaces = repeatChar(" ", count: numberOfExtraValueSpace)
        let line = "\(verticalLineSymbol) \(pair.key)\(extraKeySpaces) \(verticalLineSymbol) \(valueString)\(extraValueSpaces) \(verticalLineSymbol)"
        return line
    }

    func repeatChar(_ char: String, count: Int) -> String {
        var str: String = ""
        for _ in 0..<count {
            str += char
        }
        return str
    }
}
