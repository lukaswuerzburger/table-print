import Foundation

public func printTable(_ content: [AnyHashable : Any?], sorting: Sorting? = nil) {
    TPTablePrint().printTable(content)
}
