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
    private var _maxHealth : Int     = -1
    private var _health : Int               = -1
    private var _level : Int                = -1
    private var _status : SHIP_STATUS       = SHIP_STATUS.DEFAULT
    private var _projectile : Projectile    = pLaser()
    
    var maxHealth : Int {
        get {
            return _maxHealth
        }
    }
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
    var mainShip  : SKSpriteNode?
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: nil, color: color, size: size)
        
        //Ship initialization
        self._health                  = 100
        self._maxHealth               = self._health
        self._level                   = 1
        self._status                  = SHIP_STATUS.ALIVE
        
        
        //Main ship initialization
        mainShip                = SKSpriteNode(texture: texture!, color: color, size: size)
        mainShip?.physicsBody   = SKPhysicsBody(texture: texture!, size: size)
        mainShip?.physicsBody?.categoryBitMask = SHIP_BITMASK
        mainShip?.physicsBody?.collisionBitMask = BLANK_BITMASK
        mainShip?.physicsBody?.contactTestBitMask = METEOR_BITMASK
        let shipExhaust = SKEmitterNode(fileNamed: "ShipExhaust")
        shipExhaust!.position = CGPointMake(0, 0)
        shipExhaust!.zPosition = -1
        mainShip?.addChild(shipExhaust!)
        self.addChild(mainShip!)
        
        //Ghost Ship initialization
        ghostShip               = SKSpriteNode(texture: texture!, color: color, size: size)
        ghostShip?.position.x   = (GameScene.getInstance()?.size.width)!
        ghostShip?.physicsBody = SKPhysicsBody(texture: texture!, size: size)
        ghostShip?.physicsBody?.categoryBitMask = SHIP_BITMASK
        ghostShip?.physicsBody?.collisionBitMask = BLANK_BITMASK
        ghostShip?.physicsBody?.contactTestBitMask = METEOR_BITMASK
        let shipExhaust2 = SKEmitterNode(fileNamed: "ShipExhaust")
        shipExhaust2!.position = CGPointMake(0, 0)
        shipExhaust2!.zPosition = -1
        ghostShip!.addChild(shipExhaust2!)
        self.addChild(ghostShip!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func shoot() -> Projectile {
//        let projectile = Projectile(texture: SKTexture(imageNamed: "proj"), color: SKColor.clearColor(), size: CGSizeMake(15, 15))
        var projectile : Projectile?
        if _projectile is pLaser {
            projectile = pLaser()
        }
        else if _projectile is pFireball {
            projectile = pFireball()
        }
        
        let origin = self.position.x > 0 ?
            self.convertPoint(CGPointMake(0, 50), toNode: self.parent!) :
            ghostShip!.convertPoint(CGPointMake(0, 50), toNode:self.parent!)
        self.parent!.addChild(projectile!)
        projectile!.position = origin
        return projectile!
    }
    
    func damage(damageValue: Int) {
        self._health -= damageValue
        if(self._health <= 0) {
            self._status = SHIP_STATUS.DEAD
            //Requires cast because getInstance() -> SKScene?
            (GameScene.getInstance() as! GameScene).shipDeath()
        }
    }
    
    func upgrade(type: Upgrade) {
        print(type.name)
        if _projectile.name == type.name {
            print("UPGRADING", _projectile.name)
            _projectile.levelUp()
        }
        else if type.name == NSStringFromClass(Fireball) {
            print("GOT FIREBALL")
            _projectile = pFireball()
        }
        else if type.name == NSStringFromClass(Laser) {
            print("GOT LASER")
            _projectile = pLaser()
        }
    }

    static func getInstance() -> SpaceShip? {
        if instance == nil {
            instance = SpaceShip(texture: SKTexture(imageNamed:"Spaceship"), color: SKColor.clearColor(), size: CGSizeMake(50, 100))
        }
        return instance!
    }
    
}

