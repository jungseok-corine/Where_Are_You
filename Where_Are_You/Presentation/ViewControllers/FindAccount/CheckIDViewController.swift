//
//  CheckIDViewController.swift
//  Where_Are_You
//
//  Created by 오정석 on 2/6/2024.
//

import UIKit
import SnapKit

class CheckIDViewController: UIViewController {
    // MARK: - Propeties
    let checkIDView = CheckIDView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(checkIDView)
        checkIDView.frame = view.bounds
        
        buttonAction()
        configureNavigationBar(title: "아이디 찾기", showBackButton: false)
    }
    
    // MARK: - Selectors
    @objc func loginButtonTapped() {
        let controller = LoginViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func searchPasswordButtonTapped() {
        let controller = SearchPasswordViewController()
        navigationController?.pushViewController(controller, animated: true)

    }
    
    // MARK: - Helpers
    func buttonAction() {
        checkIDView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        checkIDView.searchPasswordButton.addTarget(self, action: #selector(searchPasswordButtonTapped), for: .touchUpInside)
    }
}
