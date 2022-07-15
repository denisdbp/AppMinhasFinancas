//
//  RegisterViewController.swift
//  AppMinhasFinancas
//
//  Created by Admin on 12/06/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    private let auth = Auth.auth()
    private var registerViewScreen:RegisterViewScreen?
    private let homeController = HomeController()
    private let alert = Alert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.registerViewScreen = RegisterViewScreen()
        self.registerViewScreen?.delegate(delegate: self)
        self.registerViewScreen?.textFieldsProtocols(delegate: self)
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.registerViewScreen
    }
}

extension RegisterViewController:RegisterViewScreenProtocol {
    
    func showLoginView() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setUser(email: String, password: String) {
        if password.count < 6{
            self.alert.alert(title: "Ops...", message: "A senha deve conter no minimo 6 digitos", controller: self)
        }else{
            self.auth.createUser(withEmail: email, password: password) { (success, error) in
                if error != nil {
                    self.alert.alert(title: "Ops...", message: "Conta ja cadastrada ou email/e ou senha incorretos", controller: self)
                }else{
                    self.alert.alertCreateUser(title: "Parabens", message: "Conta criada com sucesso !!!", controller: self) { _ in
                        self.navigationController?.pushViewController(LoginViewController(), animated: true)
                    }
                }
            }
        }
    }
}

extension RegisterViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
