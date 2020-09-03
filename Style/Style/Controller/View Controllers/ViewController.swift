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
        setupAutolayoutView()
    }

    private func setupAutolayoutView() {
        let service = NetworkService()
        let autoView = UIView(backgroundColor: .black, size: .large)

        let request = service.createRequest(url: URL(string: "https://www.google.com"), method: .get)
        service.loadData(using: request!) { (data, response, error) in
            DispatchQueue.main.async {
                guard let statusCode = response?.statusCode else {
                    //probably an Apple error (such as transport security)
                    NSLog("Bad response, can't display.")
                    return
                }
                if statusCode != 200 {
                    self.presentNetworkError(error: statusCode)
                } else {
                    UIView.animate(withDuration: 1) {
                        autoView.layer.backgroundColor = UIColor.action.cgColor
                        self.view.layer.backgroundColor = UIColor.black.cgColor
                    }
                }
            }
        }

        view.addSubview(autoView)
        autoView.center(in: view)
    }

}

