//: [Previous](@previous)

//: String Validation

extension String {
    func sanitize() {
        //This will make an array split by punctuation
        let wordArray = self.split{ !$0.isLetter }

        self = wordArray.joined()
            .lowercased()
    }

    /// determine if a given string is a valid phone number
    func isValidPhone() -> Bool {
        self.sanitize()
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    /// determine if a given string is a valid email address
    func isValidEmail() -> Bool {
        self.sanitize()
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

//: [Next](@next)
