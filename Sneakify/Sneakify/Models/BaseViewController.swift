//
//  BaseViewController.swift
//  Sneakify
//
//  Created by Мявкo on 9.11.23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
    }

    private func setupAppearance() {
        view.backgroundColor = .white
    }
}
