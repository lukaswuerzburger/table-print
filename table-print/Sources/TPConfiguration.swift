//
//  TPConfiguration.swift
//  table-print
//
//  Created by Lukas Würzburger on 9/11/18.
//  Copyright © 2018 Lukas Würzburger. All rights reserved.
//

import Foundation

public struct TPConfiguration {
    var padding = 1
    var keyTitle = "Key"
    var valueTitle = "Value"
    var edgeSymbol = "+"
    var horizontalLineSymbol = "-"
    var verticalLineSymbol = "|"
    var placeholder = "<nil>"
    public var maxWidth: Int?

    public static var shared = TPConfiguration()
}
