//
//  Emitter.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 9.10.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class Emitter {
    static func get (with label: UIImage) -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterCells = generateEmitterCells(with: label)
        return emitter
    }
    
    static func generateEmitterCells(with label: UIImage) -> [CAEmitterCell]{
        var cells = [CAEmitterCell]()
        
        let cell = CAEmitterCell()
        cell.contents = label.cgImage
        // birthRate - how many images appear at one time
        cell.birthRate = 4
        cell.lifetime = 50
        cell.velocity = CGFloat(25)
        
        // make it flying with range
        cell.emissionRange = (60*(.pi/180))
                
        // make different size of emoji
        cell.scale = 0.4
        cell.scaleRange = 0.3
        
        cells.append(cell)
        
        return cells
    }
}
