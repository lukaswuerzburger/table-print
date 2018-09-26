# TablePrint
TablePrint is a tool designed for developers. It prints tables of dictionaries in the debugger console.

### Description

TablePrint simply comes with only one function that takes a dictionary:

```swift
func printTable(_ content: [AnyHashable : Any?])
```

### Example

You can throw in a dictionary with anything in it.


##### Print Book Details

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

##### Print String Attributes


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