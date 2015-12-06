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
    
    private var _velocity : Int    = -1
    private var _strength : Int    = -1
    
    var velocity : Int {
        get {
            return _velocity
        }
    }
    var strength : Int {
        get {
            return _strength
        }
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody?.categoryBitMask = PROJECTILE_BITMASK
        physicsBody?.collisionBitMask = BLANK_BITMASK
        physicsBody?.contactTestBitMask = METEOR_BITMASK
        
        self._velocity    = 5
        self._strength    = 50
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

