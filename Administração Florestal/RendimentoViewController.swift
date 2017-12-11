//
//  RendimentoViewController.swift
//  Administração Florestal
//
//  Created by Athila Zuma on 03/12/17.
//  Copyright © 2017 Athila Zuma Queiroz Vaz. All rights reserved.
//

import UIKit

class RendimentoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var CampoNArvores: UILabel!
    @IBOutlet weak var CampoCClasses: UILabel!
    @IBOutlet weak var Estepper: UIStepper!
    @IBOutlet weak var tableView: UITableView!
    
    
    var s = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        CampoNArvores.text = "\(s) Árvores"
        CampoCClasses.text = "\(Int(Estepper.value))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func EditarNClasses(sender: UIStepper) {
        if Int(sender.value) > Classes.count {
            //Add mais um
            Classes.append(classe())
        }
        else if Int(sender.value) < Classes.count {
            //Removeu um
            Classes.removeLast()
        }
        CampoCClasses.text = "\(Int(Estepper.value))"
        tableView.reloadData()
    }
    
    @IBAction func EditarNArvores(sender: UIButton) {
        ZUMAalertaNArvores(s, viewController: self) { (N) in
            self.s = N
            self.CampoNArvores.text = "\(self.s) Árvores"
        }
    }
    
    // MARK: - TableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Classes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RendimentoTableViewCell", forIndexPath: indexPath) as! RendimentoTableViewCell
        
        let sc = Classes[indexPath.row]
        
        cell.CampoClasse.text = "Classe \(indexPath.row+1)"
        cell.CampoValor.text = "Valor Econômico: $\(sc.p)"
        cell.PontoG.text = "G = \(sc.g)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        ZUMAalertaDados(Classes[indexPath.row].p, classeG: Classes[indexPath.row].g, viewController: self) { (P, G) in
            Classes[indexPath.row].p = P
            Classes[indexPath.row].g = G
            Classes[indexPath.row].classe = indexPath.row + 1
            self.tableView.reloadData()
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SegueCalcular" {
            let DetalheView = segue.destinationViewController as! CalculoViewController
            DetalheView.Classes = Classes
            DetalheView.s = s
        }
    }

}
