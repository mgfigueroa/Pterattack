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
    
    private static var _damage : [Int : Int] = [1 : 100, 2 : 200, 3 : 300, 4 : 400, 5 : 500]
    private static var _texture : SKTexture = SKTexture(imageNamed: "Fireball")
    
    var damage : Int {
        return Fireball._damage[_level]!
    }
    
    static func newInstance() -> Fireball {
        print("FREIBALL")
        return Fireball()
    }
    
    init() {
        super.init(texture: Fireball._texture, color: Fireball._color, size: Fireball._size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}