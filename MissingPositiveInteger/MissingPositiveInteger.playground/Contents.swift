import Foundation

func findLowestPositive(from array: [Int]) -> Int {
    let sorted = array.sorted()
    guard sorted.count != 0 else { return 0 }

    // Find gap between numbers
    var lastValue: Int?
    for value in sorted where value >= 0 {

        if let lastValue = lastValue,
            value - lastValue > 1 {
            return lastValue + 1
        }
        lastValue = value
    }

    // If there was no gap
    if let last = sorted.last {
        return last + 1
    } else {
        return 0
    }
}

print(findLowestPositive(from: [3, 4, -1, 1]) == 2)
print(findLowestPositive(from: [4, 4, -1, 1]) == 2)
print(findLowestPositive(from: [1, 2, 0]) == 3)
print(findLowestPositive(from: [-1, -2, -3]) == 0)
print(findLowestPositive(from: [1, 1, -1, 3, 5, 6, 7, 8, 10, 3]) == 2)
print(findLowestPositive(from: [-1, -2, -3, 0]) == 1)
