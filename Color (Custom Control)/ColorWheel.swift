//
//  ColorWheel.swift
//  Color (Custom Control)
//
//  Created by Iyin Raphael on 1/8/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import UIKit

class ColorWheel: UIControl {
    //UIControl implements target pattern listner
    
    //draw_rect helps draw any view
    override func draw(_ rect: CGRect) {
        
        let size = bounds.size
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        
        for y in stride(from: 0, to: bounds.maxY, by: 1) {
            
            for  x in stride(from: 0, to: bounds.maxX, by: 1) {
                let dy = y - center.y
                let dx = x - center.x
                let offset = CGSize(width: dx / center.x, height: dy / center.y)
                let (hue, saturation) = Color.getHueSaturation(at: offset )
                let color =  UIColor(hue: hue, saturation: saturation, brightness: 0.8, alpha: 1.0)
                let pixel = CGRect(x: x, y: y, width: 1, height: 1)
                
                color.set()
                
                UIRectFill(pixel)
            }
        }
    }
    
}
