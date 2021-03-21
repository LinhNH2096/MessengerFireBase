//
//  RegisterViewController.swift
//  SexyUp Social Network
//
//  Created by Nguyễn Hồng Lĩnh on 24/01/2021.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let logoRegister: UIImageView = {
        let logoRegisterImageView = UIImageView()
        logoRegisterImageView.image = UIImage(named: "logo-register")
        logoRegisterImageView.contentMode = .scaleAspectFit
        return logoRegisterImageView
    }()
    
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .continue
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 12
        field.placeholder = "First Name"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .continue
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 12
        field.placeholder = "Last Name"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let dateOfBirthField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .continue
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 12
        field.placeholder = "Birthday"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .continue
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 12
        field.placeholder = "Email"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let passWordField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .continue
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 12
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let rePasswordField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .done
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 12
        field.isSecureTextEntry = true
        field.placeholder = "Re-password"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        view.backgroundColor = .white
        
        //Add gesture recognizer
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        scrollView.addGestureRecognizer(tapOnView)
        
        registerButton.addTarget(self, action: #selector(didTapOnRegisterButton), for: .touchUpInside)
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        dateOfBirthField.delegate = self
        emailField.delegate = self
        passWordField.delegate = self
        rePasswordField.delegate = self
        
        //Add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(logoRegister)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(dateOfBirthField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passWordField)
        scrollView.addSubview(rePasswordField)
        scrollView.addSubview(registerButton)
    }
    
    
    ///Set frame for subview
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Scroll View
        scrollView.frame = view.bounds
        
        //Image Logo Register
        let sizeLogoRegister = scrollView.width/4
        logoRegister.frame = CGRect(x: (scrollView.width - sizeLogoRegister)/2, y: 50, width: sizeLogoRegister, height: sizeLogoRegister)
        
        //First Name Field
        firstNameField.frame = CGRect(x: 30, y: logoRegister.bottom + 20, width: scrollView.width - 60, height: 45)
        
        //Last Name Field
        lastNameField.frame = CGRect(x: 30, y: firstNameField.bottom + 10, width: scrollView.width - 60, height: 45)
        
        //Birthdate Field
        dateOfBirthField.frame = CGRect(x: 30, y: lastNameField.bottom + 10, width: scrollView.width - 60, height: 45)
        
        //Email Field
        emailField.frame = CGRect(x: 30, y: dateOfBirthField.bottom + 10, width: scrollView.width - 60, height: 45)
        
        //Password Field
        passWordField.frame = CGRect(x: 30, y: emailField.bottom + 10, width: scrollView.width - 60, height: 45)
        
        //Repassword Field
        rePasswordField.frame = CGRect(x: 30, y: passWordField.bottom + 10, width: scrollView.width - 60, height: 45)
        
        //Register Button
        registerButton.frame = CGRect(x: 30, y: rePasswordField.bottom + 15, width: scrollView.width - 60, height: 48)
        
        
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func didTapOnRegisterButton() {
        emailField.resignFirstResponder()
        passWordField.resignFirstResponder()
        
        guard let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              let doB = dateOfBirthField.text,
              let email = emailField.text,
              let password = passWordField.text,
              let rePassword = rePasswordField.text,
              !firstName.isEmpty,
              !lastName.isEmpty,
              !doB.isEmpty,
              !email.isEmpty,
              !password.isEmpty,
              password.count >= 6,
              rePassword == password else {
            doUserRegisterError()
            return
        }
        
        //Call Register
    }
    
    
    @objc private func doUserRegisterError() {
        let alert = UIAlertController(title: "Woops",
                                      message: "Please enter all information to Register!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

extension RegisterViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameField {
            lastNameField.becomeFirstResponder()
        } else if textField == lastNameField {
            dateOfBirthField.becomeFirstResponder()
        } else if textField == dateOfBirthField {
            emailField.becomeFirstResponder()
        } else if textField == emailField {
            passWordField.becomeFirstResponder()
        } else if textField == passWordField{
            rePasswordField.becomeFirstResponder()
        } else if textField == rePasswordField {
            didTapOnRegisterButton()
        }
        return true
    }
}
