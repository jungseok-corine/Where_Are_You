//
//  AccountLoginController.swift
//  Where_Are_You
//
//  Created by 오정석 on 25/5/2024.
//

import UIKit

class AccountLoginController: UIViewController {
    // MARK: - Properties
    private let accountLoginView = AccountLoginView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(accountLoginView)
        accountLoginView.frame = view.bounds
    
        configureNavigationBar(title: "로그인", backButtonAction: #selector(backButtonTapped))
    }
    // MARK: - Helpers
    func buttonAction() {
        accountLoginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        accountLoginView.findAccountButton.button.addTarget(self, action: #selector(findAccountButtonTapped), for: .touchUpInside)
        accountLoginView.signupButton.addTarget(self, action: #selector(registerAccountButtonTapped), for: .touchUpInside)
    }

    // MARK: - Selectors
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func loginButtonTapped() {
        // 아이디, 비번 확인하고 로그인 체크
        print("login button tapped")
    }
    
    @objc func findAccountButtonTapped() {
        print("tapped")
        let controller = SearchAccountController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
        
    }
    
    @objc func registerAccountButtonTapped() {
        // 회원가입 이동하기
        print("registerAccountTapped")
    }
}
