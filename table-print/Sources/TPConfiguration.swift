import Foundation

public struct TPConfiguration {
    var padding = 1
    var keyTitle = "Key"
    var valueTitle = "Value"
    var edgeSymbol = "+"
    var horizontalLineSymbol = "-"
    var verticalLineSymbol = "|"
    var placeholder = "<nil>"
    public var maxWidth: Int?

    public static var shared = TPConfiguration()
}
