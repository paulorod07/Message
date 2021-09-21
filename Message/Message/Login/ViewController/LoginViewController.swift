//
//  ViewController.swift
//  Message
//
//  Created by Paulo Rodrigues on 20/09/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    var alert: Alert?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        
        self.view = self.loginScreen
        self.alert = Alert(controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
}

extension LoginViewController: LoginScreenProtocol {
    
    func actionLoginButton() {
        self.alert?.getAlert(title: "Atenção", message: "Dados incorretos, verifique e tente novamente")
    }
    
    func actionRegisterButton() {
        let viewController = RegisterViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.loginScreen?.emailTextField {
            self.loginScreen?.passwordTextField.becomeFirstResponder()
        } else {
            self.loginScreen?.passwordTextField.resignFirstResponder()
        }
        
        return textField.resignFirstResponder()
    }
    
}

