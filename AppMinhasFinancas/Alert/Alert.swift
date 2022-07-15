//
//  Alert.swift
//  AppMinhasFinancas
//
//  Created by Admin on 21/06/22.
//

import Foundation
import UIKit

class Alert {
    
    // Alerta generico
    public func alert(title:String, message:String, controller:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
    
    // Alerta de remocao de um registro ao banco de dados com um escaping da funcao
    public func alertRemove(title:String, message:String, controller:UIViewController, handler:@escaping (UIAlertAction)->Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: handler)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
    
    // Alerta de criacao de um usuario novo com um escaping da funcao
    public func alertCreateUser(title:String, message:String, controller:UIViewController, handler:@escaping(UIAlertAction)->Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: handler)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}
