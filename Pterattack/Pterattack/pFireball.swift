//
//  pFireball.swift
//  Pterattack
//
//  Created by Michael Figueroa on 12/5/15.
//
//

import Foundation
import SpriteKit

class pFireball: Projectile {
    internal static var _texture : SKTexture = SKTexture(imageNamed: "proj")
    internal static var _damage : [Int : Int] = [1 : 100, 2 : 200, 3 : 300, 4 : 400, 5 : 500]
    
    var damage : Int {
        return pFireball._damage[_level]!
    }
    
    init() {
        super.init(texture: pFireball._texture, color: pFireball._color, size: pFireball._size)
        name = NSStringFromClass(Fireball)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}