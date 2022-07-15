//
//  HomeController.swift
//  AppMinhasFinancas
//
//  Created by Admin on 12/06/22.
//

import Foundation
import FirebaseFirestore

class HomeController {
    
    private let dao = Dao()
    private let db = Firestore.firestore()
    private var currentUser:String?
    
    public let menuModel:[MenuModel] = [MenuModel(option: "Alimentacao", image: "food"),
                                        MenuModel(option: "Cartao", image: "cartao"),
                                        MenuModel(option: "Contas", image: "contas"),
                                        MenuModel(option: "Medicamento", image: "medicamento"),
                                        MenuModel(option: "Pagamentos", image: "pagamentos"),
                                        MenuModel(option: "Outros", image: "outros")]
    
    public var reportModel: [ReportModel] = []
    
    // Funcao que adiciona ao banco de dados do Firestore
    public func addReport(description:String, price:Double, option:String, currentUser:String){
        switch (option) {
        case "Alimentacao":
            self.dao.setReport(description: description, price: price, option: option, currentUser: currentUser)
        case "Cartao":
            self.dao.setReport(description: description, price: price, option: option, currentUser: currentUser)
        case "Contas":
            self.dao.setReport(description: description, price: price, option: option, currentUser: currentUser)
        case "Medicamento":
            self.dao.setReport(description: description, price: price, option: option, currentUser: currentUser)
        case "Pagamentos":
            self.dao.setReport(description: description, price: price, option: option, currentUser: currentUser)
        case "Outros":
            self.dao.setReport(description: description, price: price, option: option, currentUser: currentUser)
        default:
            break
        }
    }
    
    // Funcao que retorna todos os dados do banco de dados Firestore e adiciona ao array reporModel
    public func getReport(option:String){
        self.currentUser = UserDefaults.standard.object(forKey: "currentUser") as? String
        db.collection("usuarios").document(self.currentUser ?? "").collection(option).getDocuments() { (querySnapshot, error) in
            guard let querySnapshot = querySnapshot else {return}
            var reportModel = [ReportModel]()
            for document in querySnapshot.documents {
                reportModel.append(ReportModel(description: document["description"] as? String ?? "", price: document["price"] as? Double ?? 0, option: "option", documentId: document.documentID))
            }
            self.reportModel = reportModel
            NotificationCenter.default.post(name: NSNotification.Name("GetData"), object: nil)
        }
    }
    
    //Funcao que calcula todos as despesas do banco de dados
    public func calculateExpenses(){
        self.currentUser = UserDefaults.standard.object(forKey: "currentUser") as? String
        var total:Double = 0.0
        for i in 0...self.menuModel.count-1 {
            self.db.collection("usuarios").document(self.currentUser ?? "").collection(self.menuModel[i].option).getDocuments() { (querySnapshot, error) in
                guard let querySnapshot = querySnapshot else {return}
                for document in querySnapshot.documents {
                    let price = document["price"] as? Double ?? 0
                    total = total + price
                }
                UserDefaults.standard.setValue(total, forKey: "expenses")
            }
        }
    }
    
    // Funcao que remove uma despesa do banco de dados
    public func removeExpenses(indexPath:Int, option:String){
        self.currentUser = UserDefaults.standard.object(forKey: "currentUser") as? String
        self.db.collection("usuarios").document(self.currentUser ?? "").collection(option).document(self.reportModel[indexPath].documentId).delete { error in
            if error != nil {
                print("Houve um erro ao exluir o registro")
            }else {
                print("Registro excluido com sucesso")
            }
        }
    }
    
    // Funcao que formata um valor para moeda brasileira
    public func formatNumber(value:Double)->String{
        let format = NumberFormatter()
        format.locale = Locale(identifier: "pt-BR")
        format.minimumFractionDigits = 2
        format.numberStyle = .decimal
        return format.string(from: NSNumber(value: value)) ?? "Nao foi possivel atualizar o valor"
    }
}
