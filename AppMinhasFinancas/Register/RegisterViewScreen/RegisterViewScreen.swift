//
//  RegisterViewScreen.swift
//  AppMinhasFinancas
//
//  Created by Admin on 12/06/22.
//

import UIKit

protocol RegisterViewScreenProtocol {
    func showLoginView()
    func setUser(email:String, password:String)
}

class RegisterViewScreen: UIView {
    
    private var delegate:RegisterViewScreenProtocol?
    
    public func delegate(delegate:RegisterViewScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var returnButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "return"), for: .normal)
        button.addTarget(self, action: #selector(self.pressReturnButton), for: .touchUpInside)
        return button
    }()
    
    lazy var emailImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "email")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var createUserImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "createuser")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var emailTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Email"
        textField.font = UIFont(name: "Arial", size: 25)
        textField.backgroundColor = .white
        textField.keyboardType = .emailAddress
        textField.textContentType = .username
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.textContentType = .emailAddress
        textField.rightView = self.emailImage
        textField.rightViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.width))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var passwordButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "passwordhidden"), for: .normal)
        button.addTarget(self, action: #selector(self.securyPasswordEnableDisable), for: .touchUpInside)
        return button
    }()
    
    lazy var passwordTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Senha"
        textField.font = UIFont(name: "Arial", size: 25)
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        //textField.textContentType = .newPassword
        textField.rightView = self.passwordButton
        textField.rightViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.width))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar conta", for: .normal)
        button.backgroundColor = CustomColors().SteelBlue
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Arial", size: 25)
        button.addTarget(self, action: #selector(self.setUser), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = CustomColors().PowderBlue
        self.createSubViews()
        self.createConstraintWalletImage()
        self.createConstraintEmailImage()
        self.createConstraintEmailTextField()
        self.createConstraintPasswordTextField()
        self.createConstraintAccessButton()
        self.createConstraintReturnButton()
        self.createConstraintPasswordButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    @objc func pressReturnButton(){
        self.delegate?.showLoginView()
    }
    
    @objc func setUser(){
        self.delegate?.setUser(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    public func textFieldsProtocols(delegate:UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    private func createSubViews(){
        self.addSubview(self.returnButton)
        self.addSubview(self.createUserImage)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
    }
    
    private func createConstraintReturnButton(){
        NSLayoutConstraint.activate([
            self.returnButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            self.returnButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.returnButton.widthAnchor.constraint(equalToConstant: 50),
            self.returnButton.heightAnchor.constraint(equalToConstant: 30)
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
    
    private func createConstraintWalletImage(){
        NSLayoutConstraint.activate([
            self.createUserImage.topAnchor.constraint(equalTo: self.returnButton.bottomAnchor, constant: 50),
            self.createUserImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.createUserImage.widthAnchor.constraint(equalToConstant: 200),
            self.createUserImage.heightAnchor.constraint(equalToConstant: 200)
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
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.registerButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
