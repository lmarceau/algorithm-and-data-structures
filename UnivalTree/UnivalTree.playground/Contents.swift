import Foundation

class Tree {
    var value: Int
    var a: Tree?
    var b: Tree?

    init(_ value: Int, a: Tree? = nil, b: Tree? = nil) {
        self.value = value
        self.a = a
        self.b = b
    }
}

func countUnival(tree: Tree) -> Int {
    var count = 0
    var branchACounts = true
    var branchBCounts = true

    // Count child
    if let a = tree.a {
        count += countUnival(tree: a)
        branchACounts = tree.value == a.value
    }

    if let b = tree.b {
        count += countUnival(tree: b)
        branchBCounts = tree.value == b.value
    }

    // Does actual value counts as unival?
    if branchBCounts && branchACounts {
        count += 1
    }

    return count
}


print(countUnival(tree: Tree(0, a: Tree(1), b: Tree(0, a: Tree(1, a: Tree(1), b: Tree(1)), b: Tree(0)))) == 5)
print(countUnival(tree: Tree(0, a: Tree(0), b: Tree(0))) == 3)
print(countUnival(tree: Tree(0, a: Tree(0), b: Tree(1))) == 2)
