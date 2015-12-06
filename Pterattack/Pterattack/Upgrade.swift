//
//  Upgrade.swift
//  Pterattack
//
//  Created by Michael Figueroa on 12/5/15.
//
//

import Foundation
import SpriteKit

let UPGRADE_LIST : [String] = [NSStringFromClass(Fireball), NSStringFromClass(Laser)]

class Upgrade: SKSpriteNode {
    
    internal var _velocity : Int = -1
    internal var _level : Int = 1
    internal static var _size : CGSize = CGSizeMake(25,25)
    internal static var _color : SKColor = SKColor.clearColor()

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
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody?.categoryBitMask = UPGRADE_BITMASK
        physicsBody?.collisionBitMask = BLANK_BITMASK
        physicsBody?.contactTestBitMask = SHIP_BITMASK
        position.x  = CGFloat(arc4random_uniform(UInt32(GameScene.getInstance()!.size.width)))
        position.y  = size.height/2 + (GameScene.getInstance()?.size.height)!
        self._velocity = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 }


