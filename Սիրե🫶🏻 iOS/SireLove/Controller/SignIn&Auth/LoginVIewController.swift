//
//  LoginVIewController.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 29.08.23.
//

import UIKit

final class LoginVIewController: UIViewController {
    
    private let logInLabel = UILabel()
    
    private let emailLabel = UILabel()
    private let emailTextField = CustomTextField( placeholder: "Write you email")
    
    private let passwordLabel = UILabel()
    private let passwordTextField = CustomTextField(placeholder: "Type your password", addEye: true)
    
    private let forgotPassButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(.mainBlack(), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 108, height: 20)
        button.titleLabel?.font = .init(name: "SFProDisplay-Regular", size: 14)
        return button
    }()
    
    private let rememberMeButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.mainGray().cgColor
        return button
        
    }()
    private let rememberMeLabel = UILabel()
    private var rememberMeClicked: Bool! = false
    
    private let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 361, height: 44)
        button.layer.backgroundColor = UIColor.mainBlue().cgColor
        button.titleLabel?.font = .init(name: "SFProDisplay-Medium", size: 16)
        button.layer.cornerRadius = 4
        return button
    }()
    
    private let orLabel = UILabel()
    
    private let appleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue with Apple", for: .normal)
        button.setTitleColor(.mainBlack(), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 361, height: 52)
        button.titleLabel?.font = .init(name: "SFProDisplay-Medium", size: 16)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.mainGray().cgColor
        return button
    }()
    
    private let googleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue with Google", for: .normal)
        button.setTitleColor(.mainBlack(), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 361, height: 52)
        button.titleLabel?.font = .init(name: "SFProDisplay-Medium", size: 16)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.mainGray().cgColor
        return button
    }()
    
    private let dontHaveLabel = UILabel()
    private let dontHaveRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.mainBlue(), for: .normal)
        button.frame =  CGRect(x: 0, y: 0, width: 198, height: 21)
        button.titleLabel?.font = .init(name: "SFProDisplay-Bold", size: 14)
        return button
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupUI()
        setupConstraints()
        rememberMeButton.addTarget(self, action: #selector(rememberMeTouped), for: .touchUpInside)
        dontHaveRegisterButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        googleButton.addGoogleIcon()
        appleButton.addAppleIcon()
    }
    
    @objc private func registerButtonTapped() {
        let nextVC = RegistrationViewController()
        
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
}

//MARK: Setup UI and Constraints
extension LoginVIewController {
    
    private func setupUI() {
        
        logInLabel.frame = CGRect(x: 0, y: 0, width: 84, height: 33)
        logInLabel.textColor = .mainBlack()
        logInLabel.font = UIFont(name: "SFProDisplay-Bold", size: 28)
        logInLabel.text = "Log In"
        
        emailLabel.frame = CGRect(x: 0, y: 0, width: 71, height: 14)
        emailLabel.textColor = .mainBlack()
        emailLabel.font = UIFont(name: "SFProDisplay-Bold", size: 12)
        emailLabel.text = "Email"
        
        passwordLabel.frame = CGRect(x: 0, y: 0, width: 71.32, height: 14)
        passwordLabel.textColor = .mainBlack()
        passwordLabel.font = UIFont(name: "SFProDisplay-Bold", size: 12)
        passwordLabel.text = "Password"

        rememberMeLabel.frame = CGRect(x: 0, y: 0, width: 106.43, height: 18)
        rememberMeLabel.text = "Remember me?"
        rememberMeLabel.textColor = .mainBlack()
        rememberMeLabel.font = UIFont(name: "Poppins-Regular", size: 12)
        
        orLabel.frame = CGRect(x: 0, y: 0, width: 14, height: 21)
        orLabel.textColor = .mainBlack()
        orLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        orLabel.text = "or"
        
        dontHaveLabel.frame = CGRect(x: 0, y: 0, width: 198, height: 21)
        dontHaveLabel.text = "Don’t have an account?"
        dontHaveLabel.textColor = .mainBlack()
        dontHaveLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
    }
    
    private func setupConstraints() {
        
        let emailView = ButtonFormView(label: emailLabel, textField: emailTextField)
        let passwordView = ButtonFormView(label: passwordLabel, textField: passwordTextField, button: forgotPassButton)
        let bootomStackView = UIStackView(arrangedSubviews: [dontHaveLabel, dontHaveRegisterButton])
        bootomStackView.axis = .horizontal
        bootomStackView.spacing = 1
        bootomStackView.alignment = .firstBaseline
        
        logInLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailView.translatesAutoresizingMaskIntoConstraints = false
        rememberMeButton.translatesAutoresizingMaskIntoConstraints = false
        rememberMeLabel.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        bootomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logInLabel)
        view.addSubview(emailView)
        view.addSubview(passwordView)
        view.addSubview(rememberMeButton)
        view.addSubview(rememberMeLabel)
        view.addSubview(logInButton)
        view.addSubview(orLabel)
        view.addSubview(appleButton)
        view.addSubview(googleButton)
        view.addSubview(bootomStackView)
        
        NSLayoutConstraint.activate([
            logInLabel.widthAnchor.constraint(equalToConstant: 84),
            logInLabel.heightAnchor.constraint(equalToConstant: 33),
            logInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.5),
            logInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 84)
        ])
        
        NSLayoutConstraint.activate([
            emailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 96),
            emailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 35),
            passwordView.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
            passwordView.trailingAnchor.constraint(equalTo: emailView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rememberMeButton.widthAnchor.constraint(equalToConstant: 26.33),
            rememberMeButton.heightAnchor.constraint(equalToConstant: 24),
            rememberMeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            rememberMeButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            rememberMeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 59.9 ),
            rememberMeLabel.centerYAnchor.constraint(equalTo: rememberMeButton.centerYAnchor),
            rememberMeLabel.widthAnchor.constraint(equalToConstant: 106.43),
            rememberMeLabel.heightAnchor.constraint(equalToConstant: 18)
            
        ])
        
        NSLayoutConstraint.activate([
            logInButton.widthAnchor.constraint(equalToConstant: 361),
            logInButton.heightAnchor.constraint(equalToConstant: 44),
            logInButton.topAnchor.constraint(equalTo: rememberMeButton.bottomAnchor, constant: 40),
            logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            orLabel.widthAnchor.constraint(equalToConstant: 14),
            orLabel.heightAnchor.constraint(equalToConstant: 21),
            orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -1.5),
            orLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 486),
        ])
        
        NSLayoutConstraint.activate([
            appleButton.widthAnchor.constraint(equalToConstant: 361),
            appleButton.heightAnchor.constraint(equalToConstant: 52),
            appleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            appleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            appleButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            googleButton.widthAnchor.constraint(equalToConstant: 361),
            googleButton.heightAnchor.constraint(equalToConstant: 52),
            googleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            googleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            googleButton.topAnchor.constraint(equalTo: appleButton.bottomAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            bootomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.5),
            bootomStackView.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 32),
        ])
        
    }
}

//MARK: Remember Me & Text Visibility
extension LoginVIewController {
    
    @objc func rememberMeTouped() {
        if rememberMeClicked == false {
            rememberMeButton.backgroundColor = .mainBlue()
            rememberMeClicked = true
        } else {
            rememberMeButton.backgroundColor = .white
            rememberMeClicked = false
        }
    }
}

//MARK: Swift UI
import SwiftUI

struct LoginVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let loginVC = LoginVIewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) -> LoginVIewController {
            return loginVC
        }
        
        func updateUIViewController(_ uiViewController: LoginVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) {
        }
    }
}
