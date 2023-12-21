// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "TablePrint",
    products: [
        .library(
            name: "TablePrint",
            targets: ["TablePrint"]
        ),
    ],
    targets: [
        .target(name: "TablePrint", path: "table-print")
    ]
)
