//
//  FlorestaViewController.swift
//  Administração Florestal
//
//  Created by Athila Zuma on 04/12/17.
//  Copyright © 2017 Athila Zuma Queiroz Vaz. All rights reserved.
//

import UIKit

class FlorestaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelHec: UILabel!
    @IBOutlet weak var labelClasses: UILabel!
    @IBOutlet weak var stepperHec: UIStepper!
    @IBOutlet weak var stepperClasses: UIStepper!
    
    var Arvores = [arvore]()
    
    let tamanhoMaxArvore = 700//cm
    let tamanhoMinArvore = 50//cm
    var quantArvores = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func MudouHec(sender: UIStepper) {
        labelHec.text = "\(Int(sender.value))"
        quantArvores = Int(sender.value) * 1//200
        
        if quantArvores < Arvores.count {
            let nArvParaRemover = Arvores.count - quantArvores
            for i in 0..<nArvParaRemover {
                Arvores.removeLast()
            }
            collectionView.reloadData()
        }
        else
        {
            gerarFloresta()
        }
    }
    
    @IBAction func MudouClasses(sender: UIStepper) {
        labelClasses.text = "\(Int(sender.value))"
    }
    
    @IBAction func btnbar(sender: UIBarButtonItem) {
        
    }
    
    func gerarFloresta() {
        //Descobrir quantas arvores novas
        let nArv = quantArvores - Arvores.count
        
        //Criar floresta
        for _ in 0..<nArv {
            //Gerar tamanho de arvores quem cm
            let tamanho = randomInt(tamanhoMinArvore, max: tamanhoMaxArvore)
            Arvores.append(arvore(tamanho: tamanho)!)
        }
        collectionView.reloadData()
    }
    
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    
    func alturaImagem(altura: Int) -> CGFloat {
        return CGFloat((98 * altura) / tamanhoMaxArvore)
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Arvores.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FlorestaCollectionViewCell", forIndexPath: indexPath) as! FlorestaCollectionViewCell
        
        let arv = Arvores[indexPath.row]
        
        let classe = determinarClasse(arv.tamanho)
        cell.CampoTexto.text = "\(Double(arv.tamanho)/100.0)M [C:\(classe)]"
        cell.ConstraintAltura.constant = alturaImagem(arv.tamanho)
        
        
        return cell
    }
    
    func determinarClasse(h: Int) -> Int{
        let ranger = Double(tamanhoMaxArvore) / Double(Classes.count)
        let a = Double(h) / ranger
        let sobra = pegarDecimal(a)
        var c = 0
        if sobra == 0.0 {
            c = Int(a)
        }
        else
        {
            c = Int(a) + 1
        }
        return c
    }

}

func pegarDecimal(x: Double) -> Double {
    let numberOfPlaces:Double = 4.0
    let powerOfTen:Double = pow(10.0, numberOfPlaces)
    let targetedDecimalPlaces:Double = round((x % 1.0) * powerOfTen) / powerOfTen
    return targetedDecimalPlaces
}


