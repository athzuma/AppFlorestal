//
//  ZUMAalerta.swift
//  Administração Florestal
//
//  Created by Athila Zuma on 03/12/17.
//  Copyright © 2017 Athila Zuma Queiroz Vaz. All rights reserved.
//

import Foundation
import UIKit

func ZUMAalerta(titulo: String, mensagem: String, viewController: UIViewController){
    let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .Alert)
    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in}
    alertController.addAction(OKAction)
    viewController.presentViewController(alertController, animated: true) {}
}

func ZUMAalertaDados(classeP: Double, classeG: Double, viewController: UIViewController, SALVAR: (P: Double, G: Double) -> Void){
    let titulo = "Editar Informações"
    let mensagem = "Digite as informações da classe."
    let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .Alert)
    
    let saveAction = UIAlertAction(title: "Salvar", style: .Default, handler: { (action:UIAlertAction) -> Void in
        var lP = alert.textFields!.first?.text
        var lG = alert.textFields![1].text
        if lP == "" {
            lP = "0.0"
        }
        if lG == "" {
            lG = "0.0"
        }
        lP = lP!.stringByReplacingOccurrencesOfString(",", withString: ".")
        lG = lG!.stringByReplacingOccurrencesOfString(",", withString: ".")
        let p = Double(lP!)
        let g = Double(lG!)
        SALVAR(P: p!, G: g!)
    })
    
    let cancelAction = UIAlertAction(title: "Cancelar", style: .Default) {(action:UIAlertAction) -> Void in}
    
    alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
        textField.placeholder = "Valor Econômico"
        if classeP != 0 {
            textField.text = String(classeP)
        }
        textField.keyboardType = UIKeyboardType.DecimalPad
    }
    alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
        textField.placeholder = "Fração sobe de classe"
        if classeG != 0 {
            textField.text = String(classeG)
        }
        textField.keyboardType = UIKeyboardType.DecimalPad
    }
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    viewController.presentViewController(alert, animated: true) {}
}

func ZUMAalertaNArvores(inicial: Int, viewController: UIViewController, SALVAR: (N: Int) -> Void){
    let titulo = "Editar Número de Árvores"
    let mensagem = "Digite número total de árvores da floresta ou a área em hectares."
    let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .Alert)
    
    let saveAction = UIAlertAction(title: "Salvar", style: .Default, handler: { (action:UIAlertAction) -> Void in
        let n = Int((alert.textFields!.first?.text)!)
        let hs = alert.textFields![1].text
        var nfinal = 0
        if hs == "" {
            nfinal = n!
        }
        else
        {
            let h = Int(hs!)
            nfinal = h! * 2200
        }
        SALVAR(N: nfinal)
    })
    
    let cancelAction = UIAlertAction(title: "Cancelar", style: .Default) {(action:UIAlertAction) -> Void in}
    
    alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
        textField.placeholder = "Número de árvores"
        textField.text = String(inicial)
        textField.keyboardType = UIKeyboardType.DecimalPad
    }
    alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
        textField.placeholder = "Hectares"
        textField.keyboardType = UIKeyboardType.DecimalPad
    }
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    viewController.presentViewController(alert, animated: true) {}
}