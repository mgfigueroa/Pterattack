//
//  Spaceship.swift
//  Pterattack
//
//  Created by Michael Figueroa on 12/4/15.
//
//

import Foundation
import SpriteKit


class SpaceShip : SKSpriteNode {
    static var instance : SpaceShip?
    var health          = -1
    var level           = -1
    var shipColor       = SKColor.clearColor()
    var ghostShip : SKSpriteNode?
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        health                  = 100
        level                   = 1
        shipColor               = SKColor.clearColor()
        ghostShip               = SKSpriteNode(texture: SKTexture(imageNamed:"Spaceship"), color: SKColor.clearColor(), size: CGSizeMake(100, 100))
        ghostShip?.position.x   = (GameScene.getInstance()?.size.width)!
        self.addChild(ghostShip!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static func getInstance() -> SpaceShip? {
        if instance == nil {
            instance = SpaceShip(texture: SKTexture(imageNamed:"Spaceship"), color: SKColor.clearColor(), size: CGSizeMake(100, 100))
        }
        return instance!
    }
    
}

