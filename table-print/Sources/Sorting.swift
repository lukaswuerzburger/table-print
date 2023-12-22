public enum Sorting {
    case key(Direction)
    case value(Direction)

    public enum Direction {
        case ascending
        case descending
    }
}
