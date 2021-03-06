//
//  ViewController.swift
//  Message
//
//  Created by Paulo Rodrigues on 20/09/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        
        self.view = self.loginScreen
        self.auth = Auth.auth()
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
        guard let login = self.loginScreen else { return }
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { user, error in
            
            if let error = error {
                print("error = ", error)
                self.alert?.getAlert(title: "Atenção", message: "Dados incorretos, verifique e tente novamente")
            } else {
                if user != nil {
                    let homeViewController = HomeViewController()
                    
                    let navigationController = UINavigationController(rootViewController: homeViewController)
                    
                    navigationController.modalPresentationStyle = .fullScreen
                    
                    self.present(navigationController, animated: true, completion: nil)
                } else {
                    self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inesperado, Tenten novamente mais tarde")
                }
                
            }
            
        })
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

