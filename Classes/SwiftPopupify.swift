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
        addPanGestureRecognizer()

        view.addSubview(popupView)
        popupView.addSubview(mainView)

        popupView.translatesAutoresizingMaskIntoConstraints = false
        mainView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            popupView.leftAnchor.constraint(equalTo: view.leftAnchor),
            popupView.rightAnchor.constraint(equalTo: view.rightAnchor),
            popupView.heightAnchor.constraint(equalToConstant: Constants.Popup.height)
        ])
        popupBottomConstraint = popupView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.Popup.bottomConstraintHidden)
        popupBottomConstraint?.isActive = true

        let window = UIApplication.shared.windows.first
        let bottomSafeAreaHeight = window?.safeAreaInsets.bottom ?? 0.0

        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: popupView.topAnchor, constant: Constants.MainView.topConstraint),
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -bottomSafeAreaHeight)
        ])
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        show()
    }

    private func addTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    private func addPanGestureRecognizer() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }

    private func show() {
        view.layoutIfNeeded()
        self.popupBottomConstraint?.constant = Constants.Popup.bottomConstraintShown
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            self.view.layoutIfNeeded()
        }
    }

    private func hide() {
        view.layoutIfNeeded()
        self.popupBottomConstraint?.constant = Constants.Popup.bottomConstraintHidden
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
            self.view.layoutIfNeeded()
        }) { _ in
            self.dismiss(animated: false, completion: nil)
        }
    }

    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)

        if !popupView.frame.contains(location) {
            hide()
        }
    }

    @objc private func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)

        switch sender.state {
        case .changed:

            var yTranslation = translation.y
            if (popupBottomConstraint?.constant ?? 0.0) + yTranslation < Constants.Popup.bottomConstraintShown {
                yTranslation = -((popupBottomConstraint?.constant ?? 0.0) - Constants.Popup.bottomConstraintShown)
            }

            popupBottomConstraint?.constant += yTranslation
            view.layoutIfNeeded()
            
            let currentAlpha = ((popupBottomConstraint?.constant ?? 0.0) - Constants.Popup.bottomConstraintHidden) / (2 * (Constants.Popup.bottomConstraintShown - Constants.Popup.bottomConstraintHidden))
            let alpha = max(0, currentAlpha)
            view.backgroundColor = UIColor.black.withAlphaComponent(alpha)

            sender.setTranslation(.zero, in: view)

        case .ended:
            if popupBottomConstraint?.constant ?? 0 > Constants.Popup.bottomConstraintHidden * 0.4 {
                hide()
            } else {
                popupBottomConstraint?.constant = Constants.Popup.bottomConstraintShown
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                    self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
                }
            }

        default:
            break
        }
    }

}

private extension UIPopupViewController {
    enum Constants {

        enum Popup {
            static let height = 430.0
            static let bottomConstraintHidden = height
            static let bottomConstraintShown = 0.0
        }

        enum MainView {
            static let topConstraint = 40.0
        }
    }
}
