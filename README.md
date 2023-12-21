<p align="center">
    <h1>TablePrint</h1>
    <img src="https://raw.githubusercontent.com/lukaswuerzburger/table-print/develop/readme-images/xcode-debugger.png" alt="Table Print" title="Table Print" width="450"/>
    TablePrint is a tool designed for developers.<br/>
    It prints tables of dictionaries in the debugger console.
</p>

### Contents

- ✍️ [Description](#️-description)
- 🖥 [Examples](#-examples)
- 💻 [How to use](#-how-to-use)
- ⚠️ [Requirements](#️-requirements)
- 🐞 [Known Issues](#-known-issues)

### ✍️ Description

TablePrint simply comes with only one function that takes a dictionary:

```swift
func printTable(_ content: [AnyHashable : Any?])
```

### 🖥 Examples

#### 1. Book Details

You can throw in a dictionary with anything in it.

```swift
let book: [AnyHashable : Any?] = [
    "title": "The iPhone Developer's Cookbook",
    "author": "Erica Sadun",
    "publish_date": Date(timeIntervalSince1970: 1261094400),
    "price": 16.65
]
printTable(book)
```

```
+--------------+---------------------------------+
| Key          | Value                           |
+--------------+---------------------------------+
| publish_date | 2009-12-18 00:00:00 +0000       |
| author       | Erica Sadun                     |
| title        | The iPhone Developer's Cookbook |
| price        | 16.65                           |
+--------------+---------------------------------+
```

#### 2. String Attributes

```swift
let stringAttributes: [NSAttributedStringKey : Any?] = [
    .foregroundColor : UIColor.red,
    .kern : 1,
    .link: URL(string: "https://apple.com/"),
]
printTable(stringAttributes)
```

```
+---------+----------------------------------+
| Key     | Value                            |
+---------+----------------------------------+
| NSLink  | https://apple.com/               |
| NSColor | UIExtendedSRGBColorSpace 1 0 0 1 |
| NSKern  | 1                                |
+---------+----------------------------------+
```

### 💻 How to use

TablePrint is available as Swift Package.
```
https://github.com/lukaswuerzburger/table-print
```

### ⚠️ Requirements

- Swift 4+
- iOS 9+
- macOS 10.10+
- Xcode 9+

### 🐞 Known Issues

- [#2](https://github.com/lukaswuerzburger/table-print/issues/2) The column width is currently not limited. Long lines result in ugly line breaks that break the whole UI of the table.
- [#1](https://github.com/lukaswuerzburger/table-print/issues/1) Can't run on macOS command line tool.

### 💪 Contribute

Issues and pull requests are welcome.
