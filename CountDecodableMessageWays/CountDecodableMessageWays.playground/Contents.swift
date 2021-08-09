import Foundation

let FIRST_NUMBER = 1
let LAST_NUMBER = 26

extension String {
    func getFirst() -> String {
        return String(self.prefix(1))
    }

    func getFirstTwo() -> String {
        return String(self.prefix(2))
    }

    func removeFirst() -> String {
        return String(self.suffix(self.count - 1))
    }

    func removeFirstTwo() -> String {
        return String(self.suffix(self.count - 2))
    }
}

class Decoder {

    func decode(message: String) -> Int {
        var possibilities = 0
        guard message.count > 1 else { return 1 }

        // Is one char a possible code?
        if isAPossible(code: message.getFirst()) {
            possibilities += decode(message: message.removeFirst())
        }

        // Is two chars a possible code?
        guard message.count >= 2 else { return possibilities }
        if isAPossible(code: message.getFirstTwo()) {
            guard message.count > 2 else { return possibilities + 1 }
            possibilities += decode(message: message.removeFirstTwo())
        }

        return possibilities
    }

    private func isAPossible(code: String) -> Bool {
        for number in FIRST_NUMBER...LAST_NUMBER where String(number) == code {
            return true
        }
        return false
    }
}

print(Decoder().decode(message: "111") == 3)
print(Decoder().decode(message: "1112") == 5)
print(Decoder().decode(message: "3326") == 2)
print(Decoder().decode(message: "911") == 2)
