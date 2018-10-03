//
//  printTable.swift
//  table-log-ios
//
//  Created by Lukas Würzburger on 9/26/18.
//  Copyright © 2018 Lukas Würzburger. All rights reserved.
//

import Foundation

public func printTable(_ content: [AnyHashable : Any?]) {
    TPTablePrint().printTable(content)
}
