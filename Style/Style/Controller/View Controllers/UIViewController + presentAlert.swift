//
//  UIViewController + presentAlert.swift
//  Style
//
//  Created by Kenny on 9/2/20.
//  Copyright © 2020 Apollo. All rights reserved.
//

import UIKit

extension UIViewController {

    /// Show an alert with a title, message, and OK button
    /// - Parameters:
    ///   - title: The Alert's Title
    ///   - message: The Alert's Message
    ///   - vc: The View Controller Presenting the Alert
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }


    /// Show an alert with a title, message, yes button, and no button
    /// - Parameters:
    ///   - title: The Alert's Title
    ///   - message: The Alert's Message
    ///   - vc: The View Controller Presenting the Alert
    ///   - complete: Returns a bool (false if no was pressed, true if yes)
    func presentAlertWithYesNoPrompt(title: String, message: String, complete: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            complete(true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { _ in
            complete(false)
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
