//
//  LoginViewController.swift
//  SexyUp Social Network
//
//  Created by Nguyễn Hồng Lĩnh on 24/01/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let logoLogin: UIImageView = {
        let logoLoginImageView = UIImageView()
        logoLoginImageView.image = UIImage(named: "logo-login")
        logoLoginImageView.contentMode = .scaleAspectFit
        return logoLoginImageView
    }()
    
    private let emailField: UITextField = {
       let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .continue
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 12
        field.placeholder = "Email Address..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let passWordField: UITextField = {
       let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .done
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 12
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private let forgetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        view.backgroundColor = .white
        
       //Rightbar button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self ,
                                                            action:#selector(didTapOnRegisterButton))
        //Add gesture recognizer
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        scrollView.addGestureRecognizer(tapOnView)
       
        loginButton.addTarget(self, action: #selector(didTapOnLoginButton), for: .touchUpInside)
        forgetPasswordButton.addTarget(self, action: #selector(didTapOnforgetPasswordButtonButton), for: .touchUpInside)
        
        emailField.delegate = self
        passWordField.delegate = self
        
        //Add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(logoLogin)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passWordField)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(forgetPasswordButton)
    }
    
    
    ///Set frame for subview
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Scroll View
        scrollView.frame = view.bounds
        
        //Image Logo Login
        let sizeLogoLogin = scrollView.width/3
        logoLogin.frame = CGRect(x: (scrollView.width - sizeLogoLogin)/2, y: 100, width: sizeLogoLogin, height: sizeLogoLogin)
        
        //Email Field
        emailField.frame = CGRect(x: 30, y: logoLogin.bottom + 15, width: scrollView.width - 60, height: 48)
        
        //Password Field
        passWordField.frame = CGRect(x: 30, y: emailField.bottom + 10, width: scrollView.width - 60, height: 48)
        
        //Login Button
        loginButton.frame = CGRect(x: 30, y: passWordField.bottom + 10, width: scrollView.width - 60, height: 48)
        
        //Forget password
        forgetPasswordButton.frame = CGRect(x: 30 + loginButton.width/4, y: loginButton.bottom + 10, width: loginButton.width/2, height:40)
        
    }
    
    @objc private func didTapOnRegisterButton() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func didTapOnLoginButton() {
        emailField.resignFirstResponder()
        passWordField.resignFirstResponder()
        
        guard let email = emailField.text, let password = passWordField.text, !email.isEmpty, !password.isEmpty,
              password.count >= 6 else {
            doUserLoginError()
            return
        }
        
        //Call Login
        print("Login success")
    }
    
    @objc private func didTapOnforgetPasswordButtonButton() {
        let resetPasswordViewController = ResetPasswordViewController()
//        resetPasswordViewController.modalPresentationStyle = .fullScreen
        present(resetPasswordViewController, animated: true, completion: nil)
    }
    
    @objc private func doUserLoginError() {
        let alert = UIAlertController(title: "Woops",
                                      message: "Please enter all information to login!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

extension LoginViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passWordField.becomeFirstResponder()
        } else if textField == passWordField{
            didTapOnLoginButton()
        }
        return true
    }
}
