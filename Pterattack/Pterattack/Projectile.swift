//
//  Projectile.swift
//  Pterattack
//
//  Created by Clement on 12/4/15.
//
//

import Foundation
import SpriteKit

let MAX_PROJECTILE_LEVEL = 5

class Projectile : SKSpriteNode {
    internal static var _color : SKColor = SKColor.clearColor()
    internal static var _size : CGSize = CGSizeMake(25, 25)
    internal var _velocity : Int = -1
    internal var _level    : Int = -1
    
    var velocity : Int {
        get {
            return _velocity
        }
    }
    var level : Int {
        get {
            return _level
        }
    }
    
    func levelUp() {
        if(_level < MAX_PROJECTILE_LEVEL) {
            _level++
        }
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody?.categoryBitMask = PROJECTILE_BITMASK
        physicsBody?.collisionBitMask = BLANK_BITMASK
        physicsBody?.contactTestBitMask = METEOR_BITMASK
        
        self._level    = 1
        self._velocity = 5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

