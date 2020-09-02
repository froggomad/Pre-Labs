//  https://gist.github.com/amclv/d5a0d7ee7e6b037180ccdd4633ea8a5f
//  Autolayout Engine.swift
//  Style
//
//  Created by Aaron Cleveland (amclv)
//  Copyright © 2020 Apollo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    ///autolayout init
    convenience init(backgroundColor: UIColor = .red) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
    }

    /// Note: Left and right refer to left/right of screen or control
    /// Note: Leading/Trailing are affected by device locale (ie ltr/rtl language)
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                anchorLeading: CGFloat = 0,
                anchorTrailing: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: anchorLeading).isActive = true
        }

        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -anchorTrailing).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }

    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }

    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat? = nil, constant: CGFloat? = 0) {

        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant!).isActive = true

        if let leftAnchor = leftAnchor, let padding = paddingLeft {
            self.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
        }
    }

    func setDimensions(width: CGFloat, height: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func addConstraintsToFillView(_ view: UIView) {
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}
