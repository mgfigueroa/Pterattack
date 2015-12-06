//
//  Meteor.swift
//  Pterattack
//
//  Created by Clement on 12/4/15.
//
//

import Foundation
import SpriteKit


class Meteor : SKSpriteNode {
    private var _velocity : Int = -1
    private var _health : Int = -1
    private var _damage : Int = -1
    
    
    var velocity : Int {
        get {
            return _velocity
        }
    }
    var health : Int {
        get {
            return _health
        }
    }
    var damage : Int {
        get {
            return _damage
        }
    }
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, health: Int) {
        super.init(texture: texture, color: color, size: size)
        position.x  = CGFloat(arc4random_uniform(UInt32(GameScene.getInstance()!.size.width)))
        position.y  = size.height/2 + (GameScene.getInstance()?.size.height)!
        physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody?.categoryBitMask = METEOR_BITMASK
        physicsBody?.collisionBitMask = BLANK_BITMASK
        physicsBody?.contactTestBitMask = SHIP_BITMASK | PROJECTILE_BITMASK
        self._damage      = 100
        self._velocity    = 4
        self._health      = health
        self.name = NSStringFromClass(Meteor)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

