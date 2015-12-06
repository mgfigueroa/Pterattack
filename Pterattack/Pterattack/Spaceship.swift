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
    private static var instance : SpaceShip?
    private var _health : Int = -1
    private var _level : Int = -1
    private var _status : SHIP_STATUS = SHIP_STATUS.DEFAULT
    private var _projectile : Upgrade?
    
    var health : Int {
        get {
            return _health
        }
    }
    var level : Int {
        get {
            return _level
        }
    }
    var status : SHIP_STATUS {
        get {
            return _status
        }
    }
    
    var ghostShip : SKSpriteNode?
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        //Ship initialization
        physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody?.categoryBitMask = SHIP_BITMASK
        physicsBody?.collisionBitMask = BLANK_BITMASK
        physicsBody?.contactTestBitMask = METEOR_BITMASK
        self._health                  = 100
        self._level                   = 1
        self._status                  = SHIP_STATUS.ALIVE
        
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
        self._health -= damageValue
        if(self._health <= 0) {
            self._status = SHIP_STATUS.DEAD
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

