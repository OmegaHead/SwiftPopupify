//
//  ViewController.swift
//  SwiftPopupify
//
//  Created by OmegaHead on 12/29/2023.
//  Copyright (c) 2023 OmegaHead. All rights reserved.
//

import UIKit
import SwiftPopupify

class ViewController: UIViewController {

    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 10
        button.setTitle("Show popup", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)


        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

    @objc func buttonClicked() {
        let redView = UIView()
        redView.backgroundColor = .red
        let customPopupViewController = UIPopupViewController(mainView: redView)
        present(customPopupViewController, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

