//
//  ViewController.swift
//  table-log-demo-ios
//
//  Created by Lukas Würzburger on 9/10/18.
//  Copyright © 2018 Lukas Würzburger. All rights reserved.
//

import UIKit
import TablePrint

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        printStringAttributes()
        printBookDetails()
    }

    func printStringAttributes() {

        let stringAttributes: [NSAttributedStringKey : Any?] = [
            .foregroundColor : UIColor.red,
            .kern : 1,
            .link: URL(string: "https://apple.com/"),
        ]
        printTable(stringAttributes)
    }

    func printBookDetails() {
        let book: [AnyHashable : Any?] = [
            "title": "The iPhone Developer's Cookbook",
            "author": "Erica Sadun",
            "publish_date": Date(timeIntervalSince1970: 1261094400),
            "price": 16.65
        ]
        printTable(book)
    }
}
