//
//  pLaser.swift
//  Pterattack
//
//  Created by Michael Figueroa on 12/5/15.
//
//

import Foundation
import SpriteKit

class pLaser: Projectile {
    internal static var _texture : SKTexture = SKTexture(imageNamed: "proj")
    internal static var _damage : [Int : Int] = [1 : 100, 2 : 200, 3 : 300, 4 : 400, 5 : 500]
    
    var damage : Int {
        return pLaser._damage[_level]!
    }
    
    init() {
        super.init(texture: pLaser._texture, color: pLaser._color, size: pLaser._size)
        name = NSStringFromClass(Laser)
        color = SKColor.blueColor()
        colorBlendFactor = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}