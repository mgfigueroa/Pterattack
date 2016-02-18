
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
        self.maskNode = SKSpriteNode(color: SKColor.greenColor(), size: CGSizeMake((GameScene.getInstance()?.size.width)!/3, 15))
        let sprite = SKSpriteNode(color: SKColor.redColor(), size: CGSizeMake((GameScene.getInstance()?.size.width)!/3, 15))
        self.addChild(sprite)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProgress(progress: CGFloat) {
        self.maskNode?.xScale = progress
    }
    
    
}