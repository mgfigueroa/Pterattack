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
    private var UPGRADE_SPAWN_RATE : Float = 0.0025
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
    
    func spawnUpgrade() -> Upgrade?{
        let index = Int(arc4random_uniform(UInt32(UPGRADE_LIST.count)))
        let t : AnyClass? = NSClassFromString(UPGRADE_LIST[index])
        var upgrade : Upgrade? = nil
        if Float(arc4random_uniform(1000)) < UPGRADE_SPAWN_RATE * 1000.0 {
            if(t is Fireball.Type) {
                upgrade = Fireball.newInstance()
            }
            else if(t is Laser.Type) {
                upgrade = Laser.newInstance()
            }
        }
        return upgrade
    }
    
}
