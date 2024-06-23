//
//  RegisterViewModel.swift
//  Where_Are_You
//
//  Created by 오정석 on 3/6/2024.
//

import Foundation

class SignUpViewModel {
    private let signUpUseCase: SignUpUseCase
    private let checkUserIDAvailabilityUseCase: CheckUserIDAvailabilityUseCase
    private let checkEmailAvailabilityUseCase: CheckEmailAvailabilityUseCase
    private let sendEmailVerificationCodeUseCase: SendEmailVerificationCodeUseCase
    
    // Input
    var userName: String = ""
    var userID: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var email: String = ""
    var verificationCode: String = ""
    
    // Output
    var onSignUpSuccess: (() -> Void)?
    var onSignUpFailure: ((String) -> Void)?
    var onUserIDAvailabilityChecked: ((Bool) -> Void)?
    var onEmailAvailabilityChecked: ((Bool) -> Void)?
    var onEmailVerificationCodeSent: ((Bool) -> Void)?
    
    
    
    init(signUpUseCase: SignUpUseCase, checkUserIDAvailabilityUseCase: CheckUserIDAvailabilityUseCase, checkEmailAvailabilityUseCase: CheckEmailAvailabilityUseCase, sendEmailVerificationCodeUseCase: SendEmailVerificationCodeUseCase) {
        self.signUpUseCase = signUpUseCase
        self.checkUserIDAvailabilityUseCase = checkUserIDAvailabilityUseCase
        self.checkEmailAvailabilityUseCase = checkEmailAvailabilityUseCase
        self.sendEmailVerificationCodeUseCase = sendEmailVerificationCodeUseCase
    }
    
    func signUp() {
        guard password == confirmPassword else {
            onSignUpFailure?("Passwords do not match")
            return
        }
        
        let request = SignUpRequestModel(userName: userName, userID: userID, password: password, email: email)
        signUpUseCase.execute(request: request) { result in
            switch result {
            case .success:
                self.onSignUpSuccess?()
            case .failure(let error):
                self.onSignUpFailure?(error.localizedDescription)
            }
        }
    }
    
    func checkUsernameAvailability() {
        checkUserIDAvailabilityUseCase.execute(userID: userID) { result in
            switch result {
            case .success(let isAvailable):
                self.onUserIDAvailabilityChecked?(isAvailable)
            case .failure(let error):
                self.onSignUpFailure?(error.localizedDescription)
            }
        }
    }
    
    func checkEmailAvailability() {
        checkEmailAvailabilityUseCase.execute(email: email) { result in
            switch result {
            case .success(let isAvailable):
                self.onEmailAvailabilityChecked?(isAvailable)
            case .failure(let error):
                self.onSignUpFailure?(error.localizedDescription)
            }
        }
    }
    
    func sendEmailVerificationCode() {
        sendEmailVerificationCodeUseCase.execute(email: email) { result in
            switch result {
            case .success(let isSent):
                self.onEmailVerificationCodeSent?(isSent)
            case .failure(let error):
                self.onSignUpFailure?(error.localizedDescription)
            }
        }
    }
}
