//
//  ViewController.swift
//  table-log
//
//  Created by Lukas Würzburger on 6/15/18.
//  Copyright © 2018 Lukas Würzburger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Actions

    override func viewDidLoad() {
        super.viewDidLoad()

        let stuff = [
            "String" : "Hello World",
            "nil string" : nil,
            "date": Date().description
        ]

        let logger = KeyValueLogger()
        logger.log(stuff)
    }
}

