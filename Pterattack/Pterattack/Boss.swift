//
//  Boss.swift
//  Pterattack
//
//  Created by epochchhcchchhhh on 12/4/15.
//
//

import Foundation
import SpriteKit


class Boss : SKSpriteNode {
    
    var level       = -1
    var health      = -1
    var enrageTimer = -1
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        level       = 1
        health      = 1000
        enrageTimer = 120
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

