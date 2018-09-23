//
//  ViewController.swift
//  table-log-demo-ios
//
//  Created by Lukas Würzburger on 9/10/18.
//  Copyright © 2018 Lukas Würzburger. All rights reserved.
//

import UIKit
import table_log_ios

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        printSomeValues()
    }

    func printSomeValues() {
        let stuff: [String : Any?] = [
            "null value": nil,
            "string": "Yet another text",
            "color": UIColor.black
        ]
        Log(stuff)
    }
}
