//
//  UIPopupView.swift
//  Pods
//
//  Created by Mikhail Chupakhin on 30.12.2023.
//

import UIKit

class PopupView: UIView {

    private let delimeterView = UIView()

    private func setupDelimeterView() {
        addSubview(delimeterView)

        delimeterView.backgroundColor = .lightGray
        delimeterView.layer.cornerRadius = 3.0

        delimeterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            delimeterView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Delimeter.topConstraint),
            delimeterView.centerXAnchor.constraint(equalTo: centerXAnchor),
            delimeterView.heightAnchor.constraint(equalToConstant: Constants.Delimeter.height),
            delimeterView.widthAnchor.constraint(equalToConstant: Constants.Delimeter.width)
        ])
    }

    init() {
        super.init(frame: .zero)

        backgroundColor = .white
        layer.cornerRadius = 20
        
        setupDelimeterView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PopupView {
    enum Constants {

        enum Delimeter {
            static let topConstraint = 7.0
            static let height = 4.0
            static let width = 45.0
        }
    }
}
