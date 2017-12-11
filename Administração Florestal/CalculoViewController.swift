//
//  CalculoViewController.swift
//  Administração Florestal
//
//  Created by Athila Zuma on 03/12/17.
//  Copyright © 2017 Athila Zuma Queiroz Vaz. All rights reserved.
//

import UIKit

class CalculoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var s = 0
    var Classes = [classe]()
    var aux : Double = 0.00

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 1..<Classes.count {
            let ac = Classes[i-1]
            aux = aux + (1/ac.g)
            Classes[i].rt = Classes[i].p / aux
        }
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - TableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Classes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CalculoTableViewCell", forIndexPath: indexPath) as! CalculoTableViewCell
        
        let sc = Classes[indexPath.row]
        
        cell.CampoClasse.text = "Classe \(indexPath.row+1)"
        if s == 0 {
            cell.CampoValor.text = "RT\(indexPath.row+1): $\(arredondar(sc.rt))*s"
        }
        else
        {
            let rt = sc.rt * Double(s)
            cell.CampoValor.text = "RT\(indexPath.row+1): $\(arredondar(rt))"
        }
        
        
        return cell
    }
    
   

}

func arredondar(inicial: Double) -> Double{
    return Double(round(100*inicial)/100)
}
