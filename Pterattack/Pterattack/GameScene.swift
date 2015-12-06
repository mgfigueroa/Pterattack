//
//  GameScene.swift
//  Pterattack
//
//  Created by Michael Figueroa on 12/4/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

import SpriteKit
import CoreMotion

let UPGRADE_BITMASK : UInt32    = 0b1000
let PROJECTILE_BITMASK : UInt32 = 0b0100
let METEOR_BITMASK : UInt32     = 0b0010
let SHIP_BITMASK : UInt32       = 0b0001
let BLANK_BITMASK : UInt32      = 0b0000

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let THRESHOLD   = 0.05
    let VELOCITY    = CGFloat(5.0)
    
    private static var instance : SKScene?
    private var motionManager = CMMotionManager()
    private var tilt = 0.0
    private var ship : SpaceShip?
    private var level : Level?
    private var meteors = [Meteor]()
    private var projectiles = [Projectile]()
    private var upgrades = [Upgrade]()
    private var meteorsCreated = 0
    
    
    
    override func didMoveToView(view: SKView) {
        if motionManager.accelerometerAvailable == true {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { data, error in
                self.tilt = data!.acceleration.x
            })
        }
        self.backgroundColor = SKColor.whiteColor()
        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        ship = SpaceShip.getInstance()
        ship!.position = CGPointMake(size.width/2, size.height * 0.1)
        level = Level()
        self.addChild(ship!)
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        updateShipPosition()
        createMeteors()
        createUpgrades()
        updateMeteors()
        updateProjectiles()
        updateUpgrades()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        projectiles.append((ship?.shoot())!)
    }
   
    func didBeginContact(contact: SKPhysicsContact) {
        var firstBody : SKPhysicsBody
        var secondBody : SKPhysicsBody
        
        if(contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }
        else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if((firstBody.categoryBitMask & SHIP_BITMASK > 0) && (secondBody.categoryBitMask & METEOR_BITMASK > 0)) {
//            ship!.damage((secondBody.node as! Meteor).damage)
        }
        else if((firstBody.categoryBitMask & METEOR_BITMASK > 0) && (secondBody.categoryBitMask & PROJECTILE_BITMASK > 0)) {
            firstBody.node?.removeFromParent()
            secondBody.node?.removeFromParent()
        }
        else if(secondBody.node != nil && (firstBody.categoryBitMask & SHIP_BITMASK > 0) && (secondBody.categoryBitMask & UPGRADE_BITMASK > 0)) {
            ship?.upgrade(secondBody.node as! Upgrade)
            upgrades.remove(secondBody.node as! Upgrade)
            secondBody.node?.removeFromParent()
        }
        
    }
    
    private func updateProjectiles() {
        for projectile in projectiles {
            projectile.position.y += CGFloat(projectile.velocity)
        }
        //Filters offscreen objects
        for projectile in projectiles.filter({ $0.position.y - $0.size.height / 2 > self.size.height }) {
            projectiles.remove(projectile)
            projectile.removeFromParent()
        }
    }
    
    private func updateMeteors() {
        if meteorsCreated >= level?.numberOfMeteors && meteors.isEmpty {
            level?.levelUp()
            meteorsCreated = 0
            print("LEVEL UP BYTCHES")
        }
        
        for meteor in meteors {
            meteor.position.y -= CGFloat(meteor.velocity)
        }
        //Filters offscreen objects
        for meteor in meteors.filter({ $0.position.y + $0.size.height / 2 < 0 }) {
            meteors.remove(meteor)
            meteor.removeFromParent()
        }
    }
    
    private func createMeteors() {
        if meteorsCreated < level?.numberOfMeteors {
            if let meteor = level?.spawnMeteor() {
                    addChild(meteor)
                    meteors.append(meteor)
                    meteorsCreated++
            }
        }
    }
    
    private func updateUpgrades() {
        for upgrade in upgrades {
            upgrade.position.y -= CGFloat(upgrade.velocity)
        }
        //Filters offscreen objects
        for upgrade in upgrades.filter({ $0.position.y + $0.size.height / 2 < 0 }) {
            upgrades.remove(upgrade)
            upgrade.removeFromParent()
        }
    }
    
    private func createUpgrades() {
        if let upgrade = level?.spawnUpgrade() {
            addChild(upgrade)
            upgrades.append(upgrade)
        }
    }
    
    private func updateShipPosition() {
        if(abs(self.tilt) > THRESHOLD) {
            let offset = self.tilt > 0 ? VELOCITY : -VELOCITY
            ship!.position.x += offset
        }
        if(ship!.position.x > self.size.width - (ship?.size.width)! / 2) {
            ship!.position.x -= self.size.width
        }
        else if(ship!.position.x < -ship!.size.width / 2) {
            ship!.position.x += self.size.width
        }
    }
    
    func shipDeath() {
        ship!.removeFromParent()
    }
    
    static func getInstance() -> SKScene? {
        if instance == nil {
            instance = GameScene(fileNamed:"GameScene")
        }
        return instance!
        
    }
    
    static func getInstance(size: CGSize) -> SKScene? {
        if instance == nil {
            instance = GameScene(size: size)
        }
        return instance!
        
    }
}
