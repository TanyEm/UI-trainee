//
//  Emitter.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 9.10.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

enum Emojis {
    static let love =  #imageLiteral(resourceName: "love")
    static let inLove = #imageLiteral(resourceName: "in-love")
    static let kiss = #imageLiteral(resourceName: "kiss")
    static let heart = #imageLiteral(resourceName: "heart")
}

class Emitter {
    
    static var emojis:[UIImage] = [
        Emojis.love,
        Emojis.inLove,
        Emojis.kiss,
        Emojis.heart,
    ]
    
    static var velocities:[Int] = [
            50,
            45,
            75,
            100
    ]

        
    static func get () -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterCells = generateEmitterCells()
        return emitter
    }
    
    static func generateEmitterCells() -> [CAEmitterCell] {
        var cells:[CAEmitterCell] = [CAEmitterCell]()
        for index in 0..<4 {
        let cell = CAEmitterCell()
        cell.contents = getNextImage(i: index)
        // birthRate - how many images appear at one time
        cell.birthRate = 0.5
        cell.lifetime = 50
        cell.velocity = CGFloat(getRandomVelocity())
        
        // make it flying with range
        cell.emissionRange = (60*(.pi/180))
                
        // make different size of emoji
        cell.scale = 0.4
        cell.scaleRange = 0.3
        
        cells.append(cell)
        }
        return cells
    }
    
    static func getNextImage(i:Int) -> CGImage {
        return emojis[i % 4].cgImage!
    }
    
    static func getRandomVelocity() -> Int {
        return velocities[getRandomNumber()]
    }
    
    static func getRandomNumber() -> Int {
        return Int(arc4random_uniform(4))
    }

}
