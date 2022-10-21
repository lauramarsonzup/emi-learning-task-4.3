//
//  ViewController.swift
//  LearningTask-4.3
//
//  Created by rafael.rollo on 16/02/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    typealias ValidationMessage = String
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        switch validateLoginEntry() {
        case (false, let validationMessage):
            showAlert(title: "Ops", message: validationMessage)
        case (true, _):
            loginUser()
        }
         
    }
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        
        guard emailEntryIsValid() else {
            return showAlert(title: "Ops", message: "Informe seu email e tente novamente")
        }

        resetPassword(for: emailTextField.text!)
    }
    
    func validateLoginEntry() -> (Bool, ValidationMessage?) {

        guard emailEntryIsValid() else {
            return (false, "Email não pode estar em branco.")
        }
        
        guard passwordEntryIsValid() else {
            return (false, "Digite sua senha de acesso.")
        }

        return (true, nil)
    }
    
    func emailEntryIsValid() -> Bool {
        
        guard let email = emailTextField.text, !email.isEmpty else {
            return false
        }
        
        return true
    }
    
    func passwordEntryIsValid() -> Bool {
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            return false
        }
        
        return true
    }
    
    func loginUser() {
        showAlert(title: "Logando", message: "Fazendo login na sua conta...")
        eraseFormsFields()
    }
    
    func resetPassword(for email: String) {
        showAlert(title: "Redefinir senha", message: "Enviamos um email para \(email).\nSiga as instruções para criar uma nova senha segura.")
    }
    
    func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    func eraseFormsFields() {
        [emailTextField, passwordTextField].forEach { textField in
            textField?.text = ""
        }
    }

}

