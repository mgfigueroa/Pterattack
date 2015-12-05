//
//  GameScene.swift
//  Pterattack
//
//  Created by Michael Figueroa on 12/4/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    let THRESHOLD   = 0.2
    let VELOCITY    = CGFloat(5.0)
    
    static var instance : SKScene?
    var motionManager = CMMotionManager()
    var tilt = 0.0
    var ship : SpaceShip?
    var level : Level?
    var meteors = [Meteor]()
    
    override func didMoveToView(view: SKView) {
        print("WIDTH", self.size.width, self.size.height)
        if motionManager.accelerometerAvailable == true {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { data, error in
                self.tilt = data!.acceleration.x
            })
        }
        self.backgroundColor = SKColor.whiteColor()
        ship = SpaceShip.getInstance()
        ship!.position = CGPointMake(size.width/2, size.height * 0.1)
        level = Level()
        self.addChild(ship!)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    }
   
    override func update(currentTime: CFTimeInterval) {
        updateShipPosition()
        createMeteors()
        updateMeteors()
    }
    
    private func updateMeteors() {
        for meteor in meteors {
            meteor.position.y -= CGFloat(meteor.velocity)
        }
    }
    
    private func createMeteors() {
        if let meteor = level?.spawnMeteor() {
            addChild(meteor)
            meteors.append(meteor)
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
