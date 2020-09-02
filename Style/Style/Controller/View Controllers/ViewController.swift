//
//  ViewController.swift
//  Style
//
//  Created by Kenny on 9/1/20.
//  Copyright © 2020 Apollo. All rights reserved.
//

import UIKit

class ViewController: DefaultViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRoundedAutolayoutView()
    }

    private func setupRoundedAutolayoutView() {
        let autoView = UIView(backgroundColor: .blue, size: .large)

        view.addSubview(autoView)
        autoView.anchor(top: view.topAnchor,
                        left: view.leftAnchor,
                        paddingTop: 20,
                        paddingLeft: 20)
    }

}

