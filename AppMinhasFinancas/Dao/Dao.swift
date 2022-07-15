//
//  Dao.swift
//  AppMinhasFinancas
//
//  Created by Admin on 23/06/22.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class Dao {
    
    // Instancia do banco de dados Firestore
    private let db = Firestore.firestore()
    
    // Funcao que adiciona a despesa ao banco de dados Firestore
    public func setReport(description: String, price:Double, option:String, currentUser:String){
        switch (option) {
        case "Alimentacao":
            self.db.collection("usuarios").document(currentUser).collection("Alimentacao").addDocument(data: [
                "description" : description,
                "price" : price
            ])
        case "Cartao":
            self.db.collection("usuarios").document(currentUser).collection("Cartao").addDocument(data: [
                "description" : description,
                "price" : price
            ])
        case "Contas":
            self.db.collection("usuarios").document(currentUser).collection("Contas").addDocument(data: [
                "description" : description,
                "price" : price
            ])
        case "Medicamento":
            self.db.collection("usuarios").document(currentUser).collection("Medicamento").addDocument(data: [
                "description" : description,
                "price" : price
            ])
        case "Pagamentos":
            self.db.collection("usuarios").document(currentUser).collection("Pagamentos").addDocument(data: [
                "description" : description,
                "price" : price
            ])
        case "Outros":
            self.db.collection("usuarios").document(currentUser).collection("Outros").addDocument(data: [
                "description" : description,
                "price" : price
            ])
        default:
            break
        }
    }
}
