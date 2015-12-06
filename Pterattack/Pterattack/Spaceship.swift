//
//  Spaceship.swift
//  Pterattack
//
//  Created by Michael Figueroa on 12/4/15.
//
//

import Foundation
import SpriteKit

enum SHIP_STATUS {
    case ALIVE
    case DEAD
    case DEFAULT
}

class SpaceShip : SKSpriteNode {
    static var instance : SpaceShip?
    var health          = -1
    var level           = -1
    var ghostShip : SKSpriteNode?
    var status : SHIP_STATUS = SHIP_STATUS.DEFAULT
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        //Ship initialization
        physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody?.categoryBitMask = SHIP_BITMASK
        physicsBody?.collisionBitMask = BLANK_BITMASK
        physicsBody?.contactTestBitMask = METEOR_BITMASK
        health                  = 100
        level                   = 1
        status                  = SHIP_STATUS.ALIVE
        
        //Ghost Ship initialization
        ghostShip               = SKSpriteNode(texture: SKTexture(imageNamed:"Spaceship"), color: color, size: CGSizeMake(50, 100))
        ghostShip?.position.x   = (GameScene.getInstance()?.size.width)!
        ghostShip?.position.y   = 0
        ghostShip?.physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody?.categoryBitMask = SHIP_BITMASK
        physicsBody?.collisionBitMask = BLANK_BITMASK
        physicsBody?.contactTestBitMask = METEOR_BITMASK
        self.addChild(ghostShip!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func shoot() -> Projectile{
        let projectile = Projectile(texture: SKTexture(imageNamed: "proj"), color: SKColor.clearColor(), size: CGSizeMake(15, 15))
        
        let origin = self.position.x > 0 ?
            self.convertPoint(CGPointMake(0, 50), toNode: self.parent!) :
            ghostShip!.convertPoint(CGPointMake(0, 50), toNode:self.parent!)
        self.parent!.addChild(projectile)
        projectile.position = origin
        return projectile
    }
    
    func damage(damageValue: Int) {
        health -= damageValue
        if(health <= 0) {
            status = SHIP_STATUS.DEAD
            //Requires cast because getInstance() -> SKScene?
            (GameScene.getInstance() as! GameScene).shipDeath()
        }
    }

    static func getInstance() -> SpaceShip? {
        if instance == nil {
            instance = SpaceShip(texture: SKTexture(imageNamed:"Spaceship"), color: SKColor.clearColor(), size: CGSizeMake(50, 100))
        }
        return instance!
    }
    
}

