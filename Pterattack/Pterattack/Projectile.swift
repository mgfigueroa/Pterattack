//
//  Projectile.swift
//  Pterattack
//
//  Created by epochchhcchchhhh on 12/4/15.
//
//

import Foundation
import SpriteKit


class Projectile : SKSpriteNode {
    
    var velocity    = -1
    var strength    = -1
    var projColor   = SKColor.clearColor()
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        velocity    = 100
        strength    = 50
        projColor   = SKColor.redColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

