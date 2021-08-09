import Foundation

// Solution using extensions for fun :) Tried to make this has compact has possible
public extension Array where Element == Int {

    /// Get the array without a certain index without mutating itself
    func getArrayWithout(_ index: Element) -> [Element] {
        var listResult = self
        listResult.remove(at: index)
        return listResult
    }

    /// Find if there is a summation to equal a number present in this array
    /// - Parameter total: The number to find the sum equal to
    func isSumPresent(for total: Int) -> Bool {
        for (index, number) in self.enumerated() where self.getArrayWithout(index).contains(where: { $0 + number == total }) {
            return true
        }
        return false
    }
}

print([10, 15, 3, 7].isSumPresent(for: 17) == true)
print([10, 15, 3, 7].isSumPresent(for: 20) == false)
print([10, 15, 3, 7, 10].isSumPresent(for: 20) == true)
