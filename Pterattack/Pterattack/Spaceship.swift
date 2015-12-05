//
//  Spaceship.swift
//  Pterattack
//
//  Created by Michael Figueroa on 12/4/15.
//
//

import Foundation
import SpriteKit


class SpaceShip : SKSpriteNode {
    
    var health      = -1
    var level       = -1
    var shipColor   = SKColor.clearColor()
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        health      = 100
        level       = 1
        shipColor   = SKColor.blackColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

