//
//  ViewController.swift
//  Style
//
//  Created by Kenny on 9/1/20.
//  Copyright © 2020 Apollo. All rights reserved.
//

import UIKit
import NetworkScaffold

class ViewController: DefaultViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRoundedAutolayoutView()
    }

    private func setupRoundedAutolayoutView() {
        let service = NetworkService()
        let autoView = UIView(size: .large)
        let request = service.createRequest(url: URL(string: "https://www.google.com"), method: .get)
        if request != nil {
            autoView.layer.backgroundColor = UIColor.action.cgColor
        } else {
            autoView.layer.backgroundColor = UIColor.red.cgColor
        }
        view.addSubview(autoView)
        autoView.center(in: view)
    }

}

