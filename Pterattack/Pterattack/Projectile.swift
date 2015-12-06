//
//  Projectile.swift
//  Pterattack
//
//  Created by Clement on 12/4/15.
//
//

import Foundation
import SpriteKit


class Projectile : SKSpriteNode {
    
    var velocity    = -1
    var strength    = -1
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody?.categoryBitMask = PROJECTILE_BITMASK
        physicsBody?.collisionBitMask = BLANK_BITMASK
        physicsBody?.contactTestBitMask = METEOR_BITMASK
        
        velocity    = 5
        strength    = 50
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

