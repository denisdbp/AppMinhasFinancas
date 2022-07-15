//
//  ReportViewController.swift
//  AppMinhasFinancas
//
//  Created by Admin on 20/06/22.
//

import UIKit
import FirebaseFirestore

class ReportViewController: UIViewController {
    
    var reportViewScreen:ReportViewScreen?
    let homeController = HomeController()
    var homeViewController:HomeViewController?
    let alert = Alert()
    var option:String?
    public var currentUser:String?
    private var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reportViewScreen = ReportViewScreen()
        self.reportViewScreen?.textFieldProtocols(delegate: self)
        self.reportViewScreen?.configReportTableViewProtocols(delegate: self, dataSource: self)
        self.reportViewScreen?.delegate(delegate: self)
        self.homeViewController = HomeViewController()
        self.currentUser = UserDefaults.standard.object(forKey: "currentUser") as? String
        self.homeController.getReport(option: option ?? "")
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.reportViewScreen
    }
    
    @objc func detailsRemove(_ gesture:UILongPressGestureRecognizer){
        if gesture.state == .began {
            self.alert.alertRemove(title: "Tem certeza que deseja excluir o registro selecionado ?", message: "\(self.homeController.reportModel[self.index].description)", controller: self) { _ in
                self.homeController.removeExpenses(indexPath: self.index, option: self.option ?? "")
                self.homeController.getReport(option: self.option ?? "")
                self.homeController.calculateExpenses()
            }
        }
    }
}

extension ReportViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeController.reportModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReportTableViewCell().identifier, for: indexPath) as? ReportTableViewCell
        
        cell?.reportTableViewCellScreen.descriptionLabel.text = self.homeController.reportModel[indexPath.row].description
        cell?.reportTableViewCellScreen.priceLabel.text = "R$ \(self.homeController.formatNumber(value: self.homeController.reportModel[indexPath.row].price))"
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(self.detailsRemove(_:)))
        
        cell?.addGestureRecognizer(gesture)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}

extension ReportViewController:ReportViewScreenProtocol {
    func addReport(description: String, price: String) {
        if description.isEmpty {
            self.alert.alert(title: "Ops...", message: "Campo descricao deve ser preenchido", controller: self)
        } else if price.isEmpty {
            self.alert.alert(title: "Ops...", message: "Campo preco deve ser preenchido", controller: self)
        } else{
            self.homeController.addReport(description: description, price: Double(price) ?? 0, option: self.option ?? "", currentUser: self.currentUser ?? "")
            self.homeController.getReport(option: option ?? "")
            self.homeController.calculateExpenses()
        }
    }
    
    func returnHome() {
        self.navigationController?.pushViewController(self.homeViewController!, animated: true)
    }
}

extension ReportViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
