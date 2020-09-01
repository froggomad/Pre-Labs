//: [Previous](@previous)

//: String Validation
import Foundation

extension String {
    mutating func sanitize() {
        //This will make an array split by punctuation
        let wordArray = self.split{ !$0.isLetter }

        self = wordArray.joined()
            .lowercased()
    }

    /// determine if a given string is a valid phone number
    func isValidPhone() -> Bool {
        var string = self
        string.sanitize()
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: string)
    }
    /// determine if a given string is a valid email address
    func isValidEmail() -> Bool {
        var string = self
        string.sanitize()
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: string)
    }
}
//: [Next](@next)
