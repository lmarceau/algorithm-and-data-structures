class ListNode: CustomStringConvertible {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    var description: String {
        return "Node with value of: '\(self.val)"
    }
}

/// Solution implemented is to transform the first Singly Linked List into an array,
/// then while getting the second array, compare each value in the first array. This gets us the intersecting node.
class Solution {

    var intersectingNode: ListNode?

    /// Get the intersection node of two singly linked list if it exists
    /// Parameters:
    ///     - headA: The first singly linked list
    ///     - headB: The second singly linked list
    func getIntersectionNode(_ headA: ListNode, _ headB: ListNode) -> ListNode? {
        let arrayListA = getArrayAndCompare(fromHead: headA)
        let _ = getArrayAndCompare(fromHead: headB, compareToArray: arrayListA)

        return intersectingNode
    }

    /// Get the array from the head node
    /// This is a recursive function, taking the next as the new head
    /// Parameters:
    ///     - head: The actual node that is our head
    ///     - arrayList:
    ///     - compareToArray: Optional, used to compare the head value with the other linked list array
    private func getArrayAndCompare(fromHead head: ListNode, arrayList: [Int?] = [], compareToArray array: [Int?]? = nil) -> [Int?] {
        var tempArrayList = arrayList
        let value = head.val
        tempArrayList.append(value)
        self.compareHeadToArray(head: head, compareToArray: array)

        if let nextNode = head.next {
            tempArrayList = self.getArrayAndCompare(fromHead: nextNode, arrayList: tempArrayList, compareToArray: array)
        } else {
            tempArrayList.append(nil)
        }
        return tempArrayList
    }

    private func compareHeadToArray(head: ListNode, compareToArray array: [Int?]? = nil) {
        guard let compareToArray = array,
            self.isValueContained(head: head, compareToArray: compareToArray) else { return }
        self.intersectingNode = head
    }

    private func isValueContained(head: ListNode, compareToArray array: [Int?]) -> Bool {
        let value = head.val
        return array.contains(value)
    }
}


/**
Example:
         1 -> 10 - \
                 -> 3 -> nil
     0 -> 56 -> 23 - /

*/
let nodeA = ListNode(1)
nodeA.next = ListNode(10)
nodeA.next?.next = ListNode(3)
let nodeB = ListNode(0)
nodeB.next = ListNode(56)
nodeB.next?.next = ListNode(23)
nodeB.next?.next?.next = ListNode(3)

let result = Solution().getIntersectionNode(nodeA, nodeB)
print("Result: \(result.debugDescription)")
