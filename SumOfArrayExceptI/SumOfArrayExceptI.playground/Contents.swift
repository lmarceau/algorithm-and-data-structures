import Foundation

/// Multiply each of the array position by every other indexes and return the resulting array of multiplications
/// - Parameter array: The array to multiply on
func multiply(array: [Int]) -> [Int] {
    var result: [Int] = []
    for index in 0..<array.count {
        var arrayCopy = array
        arrayCopy.remove(at: index)
        result.append(arrayCopy.reduce(1, *))
    }
    return result
}

print(multiply(array: [1, 2, 3, 4, 5]) == [120, 60, 40, 30, 24])
print(multiply(array: [3, 2, 1]) == [2, 3, 6])
