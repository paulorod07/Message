//
//  RegisterViewController.swift
//  Message
//
//  Created by Paulo Rodrigues on 20/09/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
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
        
        guard let register = self.registerScreen else { return }
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword()) { result, error in
            
            if let error = error {
                self.alert?.getAlert(title: "Atenção", message: "Erro ao cadastrar, verifique os dados e tente novamente")
                
                print("error = ", error)
            } else {
                self.alert?.getAlert(title: "Parabéns", message: "Usuário cadastrado com sucesso!") {
                    self.navigationController?.popViewController(animated: true)
                }
            }
            
        }
    }
    
}
