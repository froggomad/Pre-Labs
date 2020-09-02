//: [Previous](@previous)

import UIKit

extension UIColor {
    ///these colors are in XCAssets
    enum ThemeColorName: String {
        case backgroundLight
        case backgroundDark
        case textLight
        case textDark
        case actionLight
        case actionDark
        //etc
    }

    static func getColor(_ named: ThemeColorName) -> UIColor {
        UIColor(named: named.rawValue)!
    }

    static var backgroundLight = getColor(.backgroundLight)
    //etc
}

//: [Next](@next)
