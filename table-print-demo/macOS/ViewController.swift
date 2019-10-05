//
//  ViewController.swift
//  table-print-demo-macos
//
//  Created by Lukas Würzburger on 9/23/18.
//  Copyright © 2018 Lukas Würzburger. All rights reserved.
//

import Cocoa
import TablePrint

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        TPConfiguration.shared.maxWidth = 40
        let stuff: [String : Any?] = [
            "null value": nil,
            "string": "Yet another text",
            "color": NSColor.black,
            "long word": "This hasareallylongwordwhichneedstobebrokenevenifthereisnowhitespace, and this must not mess up the layout or crash"
        ]
        printTable(stuff)

    }
}

