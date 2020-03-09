//
//  main.swift
//  table-print-demo
//
//  Created by Lukas Würzburger on 9/10/18.
//  Copyright © 2018 Lukas Würzburger. All rights reserved.
//

import Foundation
import TablePrint

let stuff: [String : Any?] = [
    "null value" : nil,
    "string" : "Yet another text",
    "Shape" : CGSize.zero
]
printTable(stuff)
