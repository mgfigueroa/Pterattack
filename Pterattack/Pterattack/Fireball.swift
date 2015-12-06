//
//  Fireball.swift
//  Pterattack
//
//  Created by Michael Figueroa on 12/5/15.
//
//

import Foundation
import SpriteKit

class Fireball: Upgrade {
    
    private static var _texture : SKTexture = SKTexture(imageNamed: "Fireball")
    
    static func newInstance() -> Fireball {
        return Fireball()
    }
    
    init() {
        super.init(texture: Fireball._texture, color: Fireball._color, size: Fireball._size)
        name = NSStringFromClass(Fireball)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}