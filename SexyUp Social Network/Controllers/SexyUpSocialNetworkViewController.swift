//
//  ViewController.swift
//  SexyUp Social Network
//
//  Created by Nguyễn Hồng Lĩnh on 24/01/2021.
//

import UIKit

class SexyUpSocialNetworkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        if !isLoggedIn {
            let loginViewController = LoginViewController()
            let nav = UINavigationController(rootViewController: loginViewController)
            nav.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            present(nav, animated: false, completion: nil)
        }
    }

}

