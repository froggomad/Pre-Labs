//
//  StyleSheet.swift
//  Style
//
//  Created by Kenny on 9/1/20.
//  Copyright © 2020 Apollo. All rights reserved.
//

import UIKit

// MARK: - Properties -

// MARK: - CGFloat + constants -
extension CGFloat {
    static let cornerRadius: CGFloat = 8

}

// MARK: - UIColor + getColor -
extension UIColor {
    ///these colors are in XCAssets
    enum ThemeColorName: String {
        case background
        case action
    }

    static func getColor(_ named: ThemeColorName) -> UIColor {
        UIColor(named: named.rawValue)!
    }

    static var background = getColor(.background)
    static var action = getColor(.action)
}

class DefaultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background
    }

}
