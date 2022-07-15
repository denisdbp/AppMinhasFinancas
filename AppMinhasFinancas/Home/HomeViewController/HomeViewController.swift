//
//  ViewController.swift
//  AppMinhasFinancas
//
//  Created by Admin on 12/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeViewScreen:HomeViewScreen?
    let homeController:HomeController = HomeController()
    let reportViewController = ReportViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.homeViewScreen = HomeViewScreen()
        self.homeViewScreen?.configMenuTableViewProtocols(delegate: self, dataSource: self)
        self.homeViewScreen?.delegate(delegate: self)
        self.homeController.calculateExpenses()
        self.homeViewScreen?.totalMesLabel.text = "R$ \(self.homeController.formatNumber(value: UserDefaults.standard.object(forKey: "expenses") as? Double ?? 0))"
        }
    
    override func loadView() {
        super.loadView()
        self.view = self.homeViewScreen
    }
}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeController.menuModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell().identifier, for: indexPath) as? MenuTableViewCell
        cell?.menuView.menuImage.image = UIImage(named: self.homeController.menuModel[indexPath.row].image)
        cell?.menuView.menuLabel.text = self.homeController.menuModel[indexPath.row].option
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(self.reportViewController, animated: true)
        self.reportViewController.option = self.homeController.menuModel[indexPath.row].option
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController:HomeViewScreenProtocol {
    func logoutButton() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
