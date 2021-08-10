import Foundation

class Node {
    var value: String
    var left: Node?
    var right: Node?

    init(_ value: String, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

extension String {
    /// Append value to a string with a comma
    /// - Parameter value: the value to append
    mutating func appendComma(_ value: String = "") {
        self.append("\(value),")
    }
}

/// Serialize a node into a string separated by comma
/// - Parameter node: the node object to loop through and translate into a string
/// - Parameter depth: keeps a reference to the depth within nodes, default is 0
func serialize(_ node: Node, depth: Int = 0) -> String {
    var serialized = ""
    serialized.appendComma("\(node.value)")

    // Left
    if let leftNode = node.left {
        serialized.append(serialize(leftNode, depth: depth + 1))
    } else {
        serialized.appendComma()
    }

    // Right
    if let rightNode = node.right {
        serialized.append(serialize(rightNode, depth: depth + 1))
    } else {
        serialized.appendComma()
    }

    // Remove extra last separator
    if depth == 0 {
        serialized = String(serialized.dropLast(1))
    }
    return serialized
}

/// Deserialize a string into a node
/// - Parameter string: The comma separated string to deserialize
func deserialize(_ string: String) -> Node {
    let components = string.components(separatedBy: ",")
    return deserializeNextNode(components)
}

/// Deserialize the next node and return a node containing all of it's children
/// - Parameter components: the splitted string into an array of string
func deserializeNextNode(_ components: [String]) -> Node {
    var componentsCopy = components
    let value = components[0]
    var left: Node?
    var right: Node?

    // Left
    if components[1] != "" {
        componentsCopy.removeFirst(1)
        left = deserializeNextNode(componentsCopy)
    } else {
        componentsCopy.removeFirst(1)
    }

    // Right
    if components[2] != "" {
        componentsCopy.removeFirst(1)
        right = deserializeNextNode(componentsCopy)
    }

    return Node(value, left: left, right: right)
}

// Assert
let node = Node("root", left: Node("left", left: Node("left.left")), right: Node("right"))
let string = "root,left,left.left,nil,nil,nil,right,nil,nil"
print(deserialize(serialize(node)).left?.left?.value == "left.left")
