//
//  Classes.swift
//  Administração Florestal
//
//  Created by Athila Zuma on 03/12/17.
//  Copyright © 2017 Athila Zuma Queiroz Vaz. All rights reserved.
//

import Foundation
import UIKit

var Classes = [classe]()

class classe {
    
    var classe : Int = 0
    var p : Double = 0.00
    var g : Double = 0.00
    var rt : Double = 0.00
    var x : Int = 0
    
    init?(classe : Int, p : Double, g : Double, rt : Double, x: Int) {
        self.classe = classe
        self.p = p
        self.g = g
        self.rt = rt
        self.x = x
    }
    
    init() {
        classe = 0
        p = 0.00
        g = 0.00
        rt = 0.00
        x = 0
    }
    
}
