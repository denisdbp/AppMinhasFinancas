//
//  LoginViewScreen.swift
//  AppMinhasFinancas
//
//  Created by Admin on 12/06/22.
//

import UIKit

protocol LoginViewScreenProtocol {
    func showRegisterView()
    func showHomeView(email:String, password:String)
}

class LoginViewScreen: UIView {
    
    private var delegate:LoginViewScreenProtocol?
    
    public func delegate(delegate:LoginViewScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var walletImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "wallet")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var emailImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "email")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var passwordButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "passwordhidden"), for: .normal)
        button.addTarget(self, action: #selector(self.securyPasswordEnableDisable), for: .touchUpInside)

        return button
    }()

    lazy var emailTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.font = UIFont(name: "Arial", size: 25)
        textField.backgroundColor = .white
        textField.keyboardType = .emailAddress
        textField.textContentType = .username
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.rightView = self.emailImage
        textField.rightViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.width))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var passwordTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Senha"
        textField.font = UIFont(name: "Arial", size: 25)
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        textField.textContentType = .password
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.rightView = self.passwordButton
        textField.rightViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.width))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var accessButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Acessar", for: .normal)
        button.backgroundColor = CustomColors().SteelBlue
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Arial", size: 25)
        button.addTarget(self, action: #selector(self.pressAccessButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Nao tem conta? Cadastre-se", for: .normal)
        button.backgroundColor = .none
        button.setTitleColor(CustomColors().MidnightBlue, for: .normal)
        button.addTarget(self, action: #selector(self.pressRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = CustomColors().PowderBlue
        self.createSubViews()
        self.createConstraintWalletImage()
        self.createConstraintEmailTextField()
        self.createConstraintPasswordTextField()
        self.createConstraintAccessButton()
        self.createConstraintRegisterButton()
        self.createConstraintEmailImage()
        self.createConstraintPasswordButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func pressAccessButton(){
        self.delegate?.showHomeView(email: self.emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @objc func pressRegisterButton(){
        self.delegate?.showRegisterView()
    }
    
    @objc func securyPasswordEnableDisable(){
        if self.passwordTextField.isSecureTextEntry {
            self.passwordTextField.isSecureTextEntry = false
            self.passwordButton.setImage(UIImage(named: "passwordeye"), for: .normal)
        }else {
            self.passwordTextField.isSecureTextEntry = true
            self.passwordButton.setImage(UIImage(named: "passwordhidden"), for: .normal)
        }
    }
    
    public func textFieldsProtocols(delegate:UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    private func createSubViews(){
        self.addSubview(self.walletImage)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.accessButton)
        self.addSubview(self.registerButton)
    }
    
    private func createConstraintWalletImage(){
        NSLayoutConstraint.activate([
            self.walletImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            self.walletImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.walletImage.widthAnchor.constraint(equalToConstant: 200),
            self.walletImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func createConstraintEmailImage(){
        NSLayoutConstraint.activate([
            self.emailImage.widthAnchor.constraint(equalToConstant: 35),
            self.emailImage.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func createConstraintPasswordButton(){
        NSLayoutConstraint.activate([
            self.passwordButton.widthAnchor.constraint(equalToConstant: 35),
            self.passwordButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func createConstraintEmailTextField(){
        NSLayoutConstraint.activate([
            self.emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.emailTextField.widthAnchor.constraint(equalToConstant: 350),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func createConstraintPasswordTextField(){
        NSLayoutConstraint.activate([
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            self.passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.passwordTextField.widthAnchor.constraint(equalToConstant: 350),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func createConstraintAccessButton(){
        NSLayoutConstraint.activate([
            self.accessButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.accessButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.accessButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func createConstraintRegisterButton(){
        NSLayoutConstraint.activate([
            self.registerButton.topAnchor.constraint(equalTo: self.accessButton.bottomAnchor, constant: 30),
            self.registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.registerButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
