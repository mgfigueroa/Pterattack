
//
//  HealthBar.swift
//  Pterattack
//
//  Created by Michael Figueroa on 2/18/16.
//
//

import Foundation
import SpriteKit

class HealthBar: SKCropNode {
    override init() {
        super.init()
        self.maskNode = SKSpriteNode(color: SKColor.whiteColor(), size: CGSizeMake((GameScene.getInstance()?.size.width)!/4, (GameScene.getInstance()?.size.height)!/100))
        let sprite = SKSpriteNode(color: SKColor.greenColor(), size: CGSizeMake((GameScene.getInstance()?.size.width)!/4, (GameScene.getInstance()?.size.height)!/100))
        sprite.name = "health"
        self.addChild(sprite)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProgress(progress: CGFloat) {
        self.maskNode?.xScale = progress
        if(progress >= 0.66){
            (self.childNodeWithName("health") as! SKSpriteNode).color = SKColor.greenColor()
        }
        else if(progress >= 0.33) {
            (self.childNodeWithName("health") as! SKSpriteNode).color = SKColor.yellowColor()
        }
        else {
            (self.childNodeWithName("health") as! SKSpriteNode).color = SKColor.redColor()
        }
        
        
        
    }
    
    
}