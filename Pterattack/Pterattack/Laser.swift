//
//  Laser.swift
//  Pterattack
//
//  Created by Michael Figueroa on 12/5/15.
//
//

import Foundation
import SpriteKit

class Laser: Upgrade {
    
    private static var _texture : SKTexture = SKTexture(imageNamed: "Fireball")
    
    static func newInstance() -> Laser {
        return Laser()
    }
    
    init() {
        super.init(texture: Laser._texture, color: Laser._color, size: Laser._size)
        name = NSStringFromClass(Laser)
        color = SKColor.blueColor()
        colorBlendFactor = 1
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}