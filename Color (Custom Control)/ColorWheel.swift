//
//  ColorWheel.swift
//  Color (Custom Control)
//
//  Created by Iyin Raphael on 1/8/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import UIKit


@IBDesignable class ColorWheel: UIControl {
    //UIControl implements target pattern listner
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true 
        let radius = frame.width / 2.0
        layer.cornerRadius = radius
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
    }
    
    //draw_rect helps draw any view
    override func draw(_ rect: CGRect) {
        
        for y in stride(from: 0, to: bounds.maxY, by: 1) {
            
            for  x in stride(from: 0, to: bounds.maxX, by: 1) {
                
                let color =  self.color(for: CGPoint(x: x, y: y))
                let pixel = CGRect(x: x, y: y, width: 1, height: 1)
                
                color.set()
                
                UIRectFill(pixel)
            }
        }
    }
    
    var color: UIColor = .white
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        color = color(for: touchPoint)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    @inline(__always) private func color(for location: CGPoint) -> UIColor {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let dy = location.y - center.y
        let dx = location.x - center.x
        let offset = CGSize(width: dx / center.x, height: dy / center.y)
        let (hue, saturation) = Color.getHueSaturation(at: offset )
        return  UIColor(hue: hue, saturation: saturation, brightness: 0.8, alpha: 1.0)
    }
    
}
