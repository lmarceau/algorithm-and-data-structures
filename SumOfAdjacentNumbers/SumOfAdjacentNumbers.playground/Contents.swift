import Foundation

typealias Pair = (previous: Int, largest: Int)

func getLargestNonAdjacentSum(list: [Int]) -> Int {
    var pair: Pair = (0, 0)
    for number in list {
        print("Number: \(number), previous: \(pair.previous), largest: \(pair.largest)")
        pair = (pair.largest, max(pair.largest, pair.previous + number))
        print("Previous: \(pair.previous), largest: \(pair.largest)")
    }
    return pair.largest
}

print(getLargestNonAdjacentSum(list: [2, 4, 6, 2, 5]) == 13)
print(getLargestNonAdjacentSum(list: [5, 1, 1, 5]) == 10)
print(getLargestNonAdjacentSum(list: [1, 5, 1, 5]) == 10)
print(getLargestNonAdjacentSum(list: [1, -5, 1, 5]) == 6)
print(getLargestNonAdjacentSum(list: [1, 0, 1, -6]) == 2)
print(getLargestNonAdjacentSum(list: [1, 2, 10, 20, 11]) == 22)
