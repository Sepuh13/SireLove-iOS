//
//  RegistrationViewController.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 31.08.23.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    private let contentView = UIView()
    
    private let plusStackView = UIStackView()
    private let registrationLabel = UILabel()
    
    private let firstNameLabel = UILabel()
    private let firstNameTextField = CustomTextField( placeholder: "Your first name")
    
    private let lastNameLabel = UILabel()
    private let lastNameTextField = CustomTextField( placeholder: "Type your last name")
    
    private let emailLabel = UILabel()
    private let emailTextField = CustomTextField( placeholder: "Write your email")
    
    private let passwordLabel = UILabel()
    private let passwordTextField = CustomTextField( placeholder: "Type your password", addEye: true)
    
    private let confirmLabel = UILabel()
    private let confirmTextField = CustomTextField( placeholder: "Confirm your password", addEye: true)
    
    private let linkSALabel = UILabel()
    private let linkSATextField = CustomTextField(placeholder: "Type your profile URL")
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Plus"), for: .normal)
        button.tintColor = .mainBlack()
        button.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        return button
    }()
    private let addSLLabel = UILabel()
    
    private let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
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
    
    private let doYouHaveLabel = UILabel()
    private let doYouHaveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.mainBlue(), for: .normal)
        button.frame =  CGRect(x: 0, y: 0, width: 198, height: 21)
        button.titleLabel?.font = .init(name: "SFProDisplay-Bold", size: 14)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        modalPresentationStyle = .fullScreen
        
        setupUI()
        setupConstraints()
        
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        googleButton.addGoogleIcon()
        appleButton.addAppleIcon()
        doYouHaveButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc private func loginTapped() {
        let nextVC = LoginVIewController()
        nextVC.modalPresentationStyle = .fullScreen
        
        present(nextVC, animated: true)
    }
}

//MARK: Setup UI and Constraints
extension RegistrationViewController {
    
    
    private func setupUI() {
        
        registrationLabel.frame = CGRect(x: 0, y: 0, width: 84, height: 33)
        registrationLabel.textColor = .mainBlack()
        registrationLabel.font = UIFont(name: "SFProDisplay-Bold", size: 28)
        registrationLabel.text = "Registration"
        
        setupButtonHead(label: firstNameLabel,
                        text: "First Name")
        setupButtonHead(label: lastNameLabel,
                        text: "Last Name")
        setupButtonHead(label: emailLabel,
                        text: "Email")
        setupButtonHead(label: passwordLabel,
                        text: "Password")
        setupButtonHead(label: confirmLabel,
                        text: "Confirm")
        setupButtonHead(label: linkSALabel,
                        text: "Link social apps")
        
        addSLLabel.frame = CGRect(x: 0, y: 0, width: 115, height: 14)
        addSLLabel.textColor = .mainBlack()
        addSLLabel.font = UIFont(name: "SFProDisplay-Bold", size: 12)
        addSLLabel.text = "Add more social links"
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        
        orLabel.frame = CGRect(x: 0, y: 0, width: 14, height: 21)
        orLabel.textColor = .mainBlack()
        orLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        orLabel.text = "or"
        
        doYouHaveLabel.frame = CGRect(x: 0, y: 0, width: 198, height: 21)
        doYouHaveLabel.text = "Do you have a account?"
        doYouHaveLabel.textColor = .mainBlack()
        doYouHaveLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
    }
    
    private func setupConstraints() {
        
        let firstNameView = ButtonFormView(label: firstNameLabel,
                                           textField: firstNameTextField)
        let lastNameView = ButtonFormView(label: lastNameLabel,
                                          textField: lastNameTextField)
        let emailView = ButtonFormView(label: emailLabel,
                                       textField: emailTextField)
        let passwordView = ButtonFormView(label: passwordLabel,
                                          textField: passwordTextField)
        let confirmView = ButtonFormView(label: confirmLabel,
                                         textField: confirmTextField)
        let linkSAView = ButtonFormView(label: linkSALabel,
                                       textField: linkSATextField)
        let doYouHaveSV = UIStackView(arrangedSubviews: [doYouHaveLabel, doYouHaveButton])
        doYouHaveSV.axis = .horizontal
        doYouHaveSV.spacing = 1
        doYouHaveSV.alignment = .firstBaseline
        
        let bootomStackView = UIStackView(arrangedSubviews: [plusButton, addSLLabel])
        bootomStackView.axis = .horizontal
        bootomStackView.spacing = 1
        bootomStackView.alignment = .firstBaseline
        plusButton.centerYAnchor.constraint(equalTo: addSLLabel.centerYAnchor).isActive = true
        
        plusStackView.addArrangedSubview(linkSAView)
        plusStackView.addArrangedSubview(bootomStackView)
        plusStackView.axis = .vertical
        plusStackView.spacing = 22
        plusStackView.alignment = .firstBaseline

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        registrationLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameView.translatesAutoresizingMaskIntoConstraints = false
        lastNameView.translatesAutoresizingMaskIntoConstraints = false
        emailView.translatesAutoresizingMaskIntoConstraints = false
        passwordView.translatesAutoresizingMaskIntoConstraints = false
        confirmView.translatesAutoresizingMaskIntoConstraints = false
        linkSAView.translatesAutoresizingMaskIntoConstraints = false
        plusStackView.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        doYouHaveSV.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(registrationLabel)
        contentView.addSubview(firstNameView)
        contentView.addSubview(lastNameView)
        contentView.addSubview(emailView)
        contentView.addSubview(passwordView)
        contentView.addSubview(confirmView)
        contentView.addSubview(plusStackView)
        contentView.addSubview(registrationButton)
        contentView.addSubview(orLabel)
        contentView.addSubview(appleButton)
        contentView.addSubview(googleButton)
        contentView.addSubview(doYouHaveSV)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
            registrationLabel.widthAnchor.constraint(equalToConstant: 161),
            registrationLabel.heightAnchor.constraint(equalToConstant: 33),
            registrationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0.5),
            registrationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 84),
        ])
        
        NSLayoutConstraint.activate([
            firstNameView.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 32),
            firstNameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            firstNameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            lastNameView.topAnchor.constraint(equalTo: firstNameView.bottomAnchor, constant: 32),
            lastNameView.leadingAnchor.constraint(equalTo: firstNameView.leadingAnchor),
            lastNameView.trailingAnchor.constraint(equalTo: firstNameView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            emailView.topAnchor.constraint(equalTo: lastNameView.bottomAnchor, constant: 32),
            emailView.leadingAnchor.constraint(equalTo: lastNameView.leadingAnchor),
            emailView.trailingAnchor.constraint(equalTo: lastNameView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 32),
            passwordView.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
            passwordView.trailingAnchor.constraint(equalTo: emailView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            confirmView.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 32),
            confirmView.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            confirmView.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            plusStackView.topAnchor.constraint(equalTo: confirmView.bottomAnchor, constant: 32),
            plusStackView.leadingAnchor.constraint(equalTo: confirmView.leadingAnchor),
            plusStackView.trailingAnchor.constraint(equalTo: confirmView.trailingAnchor),
            linkSAView.trailingAnchor.constraint(equalTo: confirmView.trailingAnchor),
            linkSAView.leadingAnchor.constraint(equalTo: confirmView.leadingAnchor),
            bootomStackView.trailingAnchor.constraint(equalTo: confirmTextField.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            registrationButton.widthAnchor.constraint(equalToConstant: 361),
            registrationButton.heightAnchor.constraint(equalToConstant: 44),
            registrationButton.topAnchor.constraint(equalTo: plusStackView.bottomAnchor, constant: 40),
            registrationButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            registrationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            //Move this on the first element of screen
//            registrationButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            orLabel.widthAnchor.constraint(equalToConstant: 14),
            orLabel.heightAnchor.constraint(equalToConstant: 21),
            orLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -1.5),
            orLabel.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 32),
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
            googleButton.topAnchor.constraint(equalTo: appleButton.bottomAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            doYouHaveSV.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.5),
            doYouHaveSV.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 32),
            doYouHaveSV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupButtonHead(label: UILabel, text: String) {
        label.frame = CGRect(x: 0, y: 0, width: 71, height: 14)
        label.textColor = .mainBlack()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 12)
        label.text = text
    }
}

extension RegistrationViewController {
    
    @objc private func plusButtonTapped() {
        
        let plusLinkSATextField = CustomTextField(placeholder: "Type your profile URL")
        plusLinkSATextField.translatesAutoresizingMaskIntoConstraints = false
        
        plusStackView.insertArrangedSubview(plusLinkSATextField, at: plusStackView.arrangedSubviews.count - 1)
        
        NSLayoutConstraint.activate([
            plusLinkSATextField.widthAnchor.constraint(equalTo: plusStackView.arrangedSubviews[0].widthAnchor),
            plusLinkSATextField.heightAnchor.constraint(equalTo: linkSATextField.heightAnchor)
        ])
        
        UIView.animate(withDuration: 0.5) {
            plusLinkSATextField.frame.origin.y -= 100
            self.scrollView.contentOffset.y += 100
        }
    }
}

//MARK: Swift UI
import SwiftUI

struct RegistrationVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let registrationVC = RegistrationViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<RegistrationVCProvider.ContainerView>) -> RegistrationViewController {
            return registrationVC
        }
        
        func updateUIViewController(_ uiViewController: RegistrationVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<RegistrationVCProvider.ContainerView>) {
        }
    }
}


