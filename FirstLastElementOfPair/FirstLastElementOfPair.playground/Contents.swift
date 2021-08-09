import Foundation

typealias Pair = (a: Int, b: Int)

func constructPair(_ a: Int, _ b: Int) -> Pair {
    return Pair(a, b)
}

func car(_ pair: Pair) -> Int {
    return pair.a
}

func cdr(_ pair: Pair) -> Int {
    return pair.b
}

print(car(constructPair(3, 4)) == 3)
print(cdr(constructPair(3, 4)) == 4)
