//
//  ReportViewScreen.swift
//  AppMinhasFinancas
//
//  Created by Admin on 20/06/22.
//

import UIKit

protocol ReportViewScreenProtocol {
    func addReport(description:String, price:String)
    func returnHome()
}

class ReportViewScreen: UIView {
    
    var delegate:ReportViewScreenProtocol?
    
    public func delegate(delegate:ReportViewScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var viewHeader:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.reportTableView.frame.width, height: 100))
        view.backgroundColor = CustomColors().PowderBlue
        return view
    }()
    
    lazy var addDescriptionTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Descricao"
        textField.backgroundColor = .white
        textField.font = UIFont(name: "Arial", size: 15)
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    lazy var addPriceTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Valor"
        textField.backgroundColor = .white
        textField.font = UIFont(name: "Arial", size: 15)
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    lazy var addButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(self.addReport), for: .touchUpInside)
        return button
    }()
    
    lazy var returnButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Voltar", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(self.returnHome), for: .touchUpInside)
        return button
    }()
    
    lazy var reportTableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ReportTableViewCell.self, forCellReuseIdentifier: ReportTableViewCell().identifier)
        tableView.backgroundColor = CustomColors().PowderBlue
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createSubViews()
        self.createConstraintReportTableView()
        self.backgroundColor = CustomColors().PowderBlue
        self.reportTableView.tableHeaderView = self.viewHeader
        self.viewHeader.addSubview(self.addDescriptionTextField)
        self.viewHeader.addSubview(self.addButton)
        self.viewHeader.addSubview(self.addPriceTextField)
        self.createConstraintAddDescriptionTextField()
        self.createConstraintAddButton()
        self.createConstraintAddPriceTextField()
        self.createConstraintReturnButton()
        NotificationCenter.default.addObserver(self, selector: #selector(self.getData), name: NSNotification.Name("GetData"), object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func getData(){
        self.reportTableView.reloadData()
    }
    
    @objc func addReport(){
        self.delegate?.addReport(description: self.addDescriptionTextField.text ?? "", price: self.addPriceTextField.text ?? "")
        self.reportTableView.reloadData()
    }
    
    public func textFieldProtocols(delegate:UITextFieldDelegate){
        self.addDescriptionTextField.delegate = delegate
        self.addPriceTextField.delegate = delegate
    }
    
    public func reloadTableView(){
        self.reportTableView.reloadData()
    }
    
    @objc func returnHome(){
        self.delegate?.returnHome()
        self.reportTableView.reloadData()
    }
    
    public func configReportTableViewProtocols(delegate:UITableViewDelegate, dataSource:UITableViewDataSource){
        self.reportTableView.delegate = delegate
        self.reportTableView.dataSource = dataSource
    }
    
    private func createSubViews(){
        self.addSubview(self.reportTableView)
        self.addSubview(self.returnButton)
    }
    
    private func createConstraintReportTableView(){
        NSLayoutConstraint.activate([
            self.reportTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.reportTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.reportTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func createConstraintAddDescriptionTextField(){
        NSLayoutConstraint.activate([
            self.addDescriptionTextField.topAnchor.constraint(equalTo: self.viewHeader.topAnchor, constant: 10),
            self.addDescriptionTextField.leadingAnchor.constraint(equalTo: self.viewHeader.leadingAnchor, constant: 10),
            self.addDescriptionTextField.widthAnchor.constraint(equalToConstant: 200),
            self.addDescriptionTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func createConstraintAddPriceTextField(){
        NSLayoutConstraint.activate([
            self.addPriceTextField.topAnchor.constraint(equalTo: self.viewHeader.topAnchor, constant: 10),
            self.addPriceTextField.leadingAnchor.constraint(equalTo: self.addDescriptionTextField.trailingAnchor, constant: 5),
            self.addPriceTextField.trailingAnchor.constraint(equalTo: self.addButton.leadingAnchor, constant: -5),
            self.addPriceTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func createConstraintAddButton(){
        NSLayoutConstraint.activate([
            self.addButton.topAnchor.constraint(equalTo: self.viewHeader.topAnchor, constant: 10),
            self.addButton.trailingAnchor.constraint(equalTo: self.viewHeader.trailingAnchor, constant: -5),
            self.addButton.widthAnchor.constraint(equalToConstant: 40),
            self.addButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func createConstraintReturnButton(){
        NSLayoutConstraint.activate([
            self.returnButton.topAnchor.constraint(equalTo: self.reportTableView.bottomAnchor),
            self.returnButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.returnButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.returnButton.heightAnchor.constraint(equalToConstant: 50),
            self.returnButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
}
