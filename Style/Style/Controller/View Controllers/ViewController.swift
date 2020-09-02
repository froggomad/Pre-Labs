//
//  ViewController.swift
//  Style
//
//  Created by Kenny on 9/1/20.
//  Copyright © 2020 Apollo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let autoView = UIView(backgroundColor: .action)

        view.addSubview(autoView)

        autoView.anchor(top: view.topAnchor,
                        left: view.leftAnchor,
                        paddingTop: 20,
                        paddingLeft: 20,
                        width: 20,
                        height: 20)

    }

}

