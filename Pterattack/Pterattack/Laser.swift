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
    
    private static var _damage : [Int : Int] = [1 : 100, 2 : 200, 3 : 300, 4 : 400, 5 : 500]
    private static var _texture : SKTexture = SKTexture(imageNamed: "Fireball")
    
    var damage : Int {
        return Laser._damage[_level]!
    }
    
    static func newInstance() -> Laser {
        print("LASERSRE")
        return Laser()
    }
    
    init() {
        super.init(texture: Laser._texture, color: Laser._color, size: Laser._size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}