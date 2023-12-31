//
//  SwiftPopupify.swift
//  Pods
//
//  Created by Mikhail Chupakhin on 29.12.2023.
//

import Foundation
import UIKit

public class UIPopupViewController: UIViewController {

    private let popupView = PopupView()
    private var popupBottomConstraint: NSLayoutConstraint? = nil
    private let mainView: UIView

    public init(mainView: UIView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureRecognizer()
        view.addSubview(popupView)
        popupView.addSubview(mainView)

        popupView.translatesAutoresizingMaskIntoConstraints = false
        mainView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            popupView.leftAnchor.constraint(equalTo: view.leftAnchor),
            popupView.rightAnchor.constraint(equalTo: view.rightAnchor),
            popupView.heightAnchor.constraint(equalToConstant: Constants.Popup.height)
        ])
        popupBottomConstraint = popupView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        popupBottomConstraint?.isActive = true

        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: popupView.topAnchor, constant: Constants.MainView.topConstraint),
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        popupBottomConstraint?.constant = -Constants.Popup.bottomConstraintHidden

    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        show()
    }

    private func addTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    private func show() {
        view.layoutIfNeeded()
        self.popupBottomConstraint?.constant = Constants.Popup.bottomConstraintShown
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()

            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }
    }

    private func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(
                x: 0,
                y: self.view.frame.maxY,
                width: self.view.frame.width,
                height: self.view.frame.height
            )

            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        }) { _ in
            self.dismiss(animated: false, completion: nil)
        }
    }

    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)

        if !popupView.frame.contains(location) {
            dismiss(animated: false, completion: nil)
        }
    }
}

private extension UIPopupViewController {
    enum Constants {

        enum Popup {
            static let height = 430.0
            static let bottomConstraintHidden = -height
            static let bottomConstraintShown = 0.0
        }

        enum MainView {
            static let topConstraint = 40.0
        }
    }
}
