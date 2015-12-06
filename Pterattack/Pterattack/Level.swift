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
    
    private var level : Int = 0
    private static var SPAWN_RATES: [Int : Float] = [1 : 0.01, 2 : 0.02, 3 : 0.03]
    private static var METEORS_PER_LEVEL: [Int: Int] = [1 : 20, 2 : 30, 3 : 40]
    
    var currentLevel : Int {
        get {
            return level
        }
    }
    var numberOfMeteors : Int {
        get {
            return Level.METEORS_PER_LEVEL[level]!
        }
    }
    
    init() {
        level = 1
    }
    
    func levelUp() {
        level++
    }
    
    func spawnMeteor() -> Meteor?{
        let meteor : Meteor? = Float(arc4random_uniform(100)) < Level.SPAWN_RATES[level]! * 100.0 ? Meteor(texture: SKTexture(imageNamed: "Meteor"), color: SKColor.clearColor(), size: CGSizeMake(25, 25), health: 100) : nil
        return meteor
    }
    
}
