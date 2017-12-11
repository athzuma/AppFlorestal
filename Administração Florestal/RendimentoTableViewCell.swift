//
//  RendimentoTableViewCell.swift
//  Administração Florestal
//
//  Created by Athila Zuma on 03/12/17.
//  Copyright © 2017 Athila Zuma Queiroz Vaz. All rights reserved.
//

import UIKit

class RendimentoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var CampoClasse: UILabel!
    @IBOutlet weak var CampoValor: UILabel!
    @IBOutlet weak var PontoG: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
