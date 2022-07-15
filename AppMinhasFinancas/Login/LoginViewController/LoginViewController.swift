//
//  LoginViewController.swift
//  AppMinhasFinancas
//
//  Created by Admin on 12/06/22.
//

import UIKit
import FirebaseAuth
import UserNotifications

class LoginViewController: UIViewController {
    
    private let auth = Auth.auth()
    private var loginViewScreen:LoginViewScreen?
    private let registerViewController:RegisterViewController = RegisterViewController()
    private let homeViewController = HomeViewController()
    private let homeController = HomeController()
    private let alert = Alert()
    private let dao = Dao()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginViewScreen = LoginViewScreen()
        self.loginViewScreen?.delegate(delegate: self)
        self.loginViewScreen?.textFieldsProtocols(delegate: self)
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.loginViewScreen
    }
}

extension LoginViewController:LoginViewScreenProtocol {
    func showRegisterView() {
        self.navigationController?.pushViewController(self.registerViewController, animated: true)
    }
    
    func showHomeView(email: String, password: String) {
            self.auth.signIn(withEmail: email, password: password) { (success, error) in
                if error != nil {
                    self.alert.alert(title: "Ops...", message: "Usuario e/ou senha incorretos", controller: self)
                }else{
                    guard let user = self.auth.currentUser?.uid else {return}
                    UserDefaults.standard.setValue(user, forKey: "currentUser")
                    self.navigationController?.pushViewController(self.homeViewController, animated: true)
                }
            }
        }
    }

extension LoginViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
