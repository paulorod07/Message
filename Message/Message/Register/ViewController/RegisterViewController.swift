//
//  RegisterViewController.swift
//  Message
//
//  Created by Paulo Rodrigues on 20/09/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    var alert: Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.alert = Alert(controller: self)
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.registerScreen?.emailTextField {
            self.registerScreen?.passwordTextField.becomeFirstResponder()
        } else {
            self.registerScreen?.passwordTextField.resignFirstResponder()
        }
        
        return textField.resignFirstResponder()
    }
    
}

extension RegisterViewController: RegisterScreenProtocol {
    
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
    }
    
}
