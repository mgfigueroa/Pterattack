//
//  Meteor.swift
//  Pterattack
//
//  Created by epochchhcchchhhh on 12/4/15.
//
//

import Foundation
import SpriteKit


class Meteor : SKSpriteNode {
    
    var velocity    = -1
    var size        = -1
    var health      = -1
    var metColor    = SKColor.clearColor()
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        velocity    = 100
        size        = 50
        health      = 100
        metColor    = SKColor.blackColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

