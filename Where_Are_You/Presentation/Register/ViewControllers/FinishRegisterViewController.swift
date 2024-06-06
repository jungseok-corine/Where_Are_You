//
//  FinishRegisterViewController.swift
//  Where_Are_You
//
//  Created by 오정석 on 6/6/2024.
//

import UIKit

class FinishRegisterViewController: UIViewController {
    // MARK: - Properties
    
    let finishView = FinishRegisterview()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(finishView)
        finishView.frame = view.bounds
        
        configureNavigationBar(title: "회원가입")
        buttonActions()
    }
    
    // MARK: - Helpers
    
    func buttonActions() {
        finishView.bottomButtonView.button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    // MARK: - Selectors
    @objc func loginButtonTapped() {
        let controller = AccountLoginController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
}
