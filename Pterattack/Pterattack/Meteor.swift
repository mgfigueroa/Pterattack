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
    
    var velocity = -1
    var health   = -1
    var metColor = SKColor.clearColor()
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        position.x  = CGFloat(arc4random_uniform(UInt32(GameScene.getInstance()!.size.width)))
        position.y  = size.height/2 + (GameScene.getInstance()?.size.height)!
        physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody?.categoryBitMask = METEOR_BITMASK
        physicsBody?.collisionBitMask = BLANK_BITMASK
        physicsBody?.contactTestBitMask = SHIP_BITMASK | PROJECTILE_BITMASK
        
        velocity    = 2
        health      = 100
        metColor    = color
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

