//
//  Level.swift
//  Pterattack
//
//  Created by Michael Figueroa on 12/4/15.
//
//

import Foundation
import SpriteKit


class Level {
    var gameLevel : Int
    private static var SPAWN_RATES: [Int : Float] = [1 : 0.01, 2 : 0.02, 3 : 0.03]
    
    init() {
        gameLevel = 1
    }
    
    func levelUp() {
        gameLevel++
    }
    
    func spawnMeteor() -> Meteor?{
        let meteor : Meteor? = Float(arc4random_uniform(100)) < Level.SPAWN_RATES[self.gameLevel]! * 100.0 ? Meteor(texture: SKTexture(imageNamed: "Meteor"), color: SKColor.clearColor(), size: CGSizeMake(25, 25)) : nil
        return meteor
    }

    
    
//    enum SPAWN_RATES : Float{
//        case LEVEL_1 = .01
//        case LEVEL_2 = .02
//        case LEVEL_3 = .03
//    }
}
