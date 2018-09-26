# TablePrint
TablePrint is a tool designed for developers. It prints tables of dictionaries in the debugger console.

### Contents

- ✍️ Description
- 🖥 Examples
- 👩‍💻👨‍💻 How to use
- ⚠️ Requierments

### ✍️ Description

TablePrint simply comes with only one function that takes a dictionary:

```swift
func printTable(_ content: [AnyHashable : Any?])
```

### 🖥 Examples

##### 📕 Book Details

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

Result

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

##### 🔗 String Attributes

```swift
let stringAttributes: [NSAttributedStringKey : Any?] = [
    .foregroundColor : UIColor.red,
    .kern : 1,
    .link: URL(string: "https://apple.com/"),
]
printTable(stringAttributes)
```

Result

```
+---------+----------------------------------+
| Key     | Value                            |
+---------+----------------------------------+
| NSLink  | https://apple.com/               |
| NSColor | UIExtendedSRGBColorSpace 1 0 0 1 |
| NSKern  | 1                                |
+---------+----------------------------------+
```

### 👩‍💻👨‍💻 How to use

TablePrint is not yet ready, however planned to be available over Cocoapods.

### ⚠️ Requierments

- iOS 9+
- macOS 10.10+
- Xcode 9+

### 💪 Contribute

Issues and pull requests are welcome.
