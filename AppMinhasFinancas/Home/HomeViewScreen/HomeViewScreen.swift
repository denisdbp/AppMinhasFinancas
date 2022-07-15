//
//  HomeViewScreen.swift
//  AppMinhasFinancas
//
//  Created by Admin on 12/06/22.
//

import UIKit

protocol HomeViewScreenProtocol {
    func logoutButton()
}

class HomeViewScreen: UIView {
    
    var delegate:HomeViewScreenProtocol?
    
    public func delegate(delegate:HomeViewScreenProtocol){
        self.delegate = delegate
    }

    lazy var totalGastoView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColors().DarkSlateBlue
        return view
    }()
    
    lazy var totalGastoMesLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total de Gastos"
        label.font = UIFont(name: "Arial", size: 25)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var totalMesLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 0,00"
        label.font = UIFont(name: "Arial", size: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var logoutButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "logout"), for: .normal)
        button.addTarget(self, action: #selector(self.logout), for: .touchUpInside)
        return button
    }()
    
    lazy var menuTableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell().identifier)
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.createSubViews()
        self.createConstraintTotalGastoView()
        self.createConstraintTotalGastoMesLabel()
        self.createConstraintTotalMesLabel()
        self.createConstraintLogoutButton()
        self.createConstraintMenuTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func logout(){
        self.delegate?.logoutButton()
    }
    
    public func configMenuTableViewProtocols(delegate:UITableViewDelegate, dataSource:UITableViewDataSource){
        self.menuTableView.delegate = delegate
        self.menuTableView.dataSource = dataSource
    }
    
    private func createSubViews(){
        self.addSubview(self.totalGastoView)
        self.totalGastoView.addSubview(self.totalGastoMesLabel)
        self.totalGastoView.addSubview(self.totalMesLabel)
        self.totalGastoView.addSubview(self.logoutButton)
        self.addSubview(self.menuTableView)
    }
    
    private func createConstraintTotalGastoView(){
        NSLayoutConstraint.activate([
            self.totalGastoView.topAnchor.constraint(equalTo: self.topAnchor),
            self.totalGastoView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.totalGastoView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.totalGastoView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func createConstraintTotalGastoMesLabel(){
        NSLayoutConstraint.activate([
            self.totalGastoMesLabel.topAnchor.constraint(equalTo: self.totalGastoView.topAnchor, constant: 80),
            self.totalGastoMesLabel.leadingAnchor.constraint(equalTo: self.totalGastoView.leadingAnchor, constant: 10)
        ])
    }
    
    private func createConstraintTotalMesLabel(){
        NSLayoutConstraint.activate([
            self.totalMesLabel.topAnchor.constraint(equalTo: self.totalGastoMesLabel.bottomAnchor, constant: 20),
            self.totalMesLabel.leadingAnchor.constraint(equalTo: self.totalGastoView.leadingAnchor, constant: 10)
        ])
    }
    
    private func createConstraintLogoutButton(){
        NSLayoutConstraint.activate([
            self.logoutButton.topAnchor.constraint(equalTo: self.totalGastoView.topAnchor, constant: 80),
            self.logoutButton.trailingAnchor.constraint(equalTo: self.totalGastoView.trailingAnchor, constant: -10),
            self.logoutButton.widthAnchor.constraint(equalToConstant: 30),
            self.logoutButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func createConstraintMenuTableView(){
        NSLayoutConstraint.activate([
            self.menuTableView.topAnchor.constraint(equalTo: self.totalGastoView.bottomAnchor),
            self.menuTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.menuTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.menuTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
