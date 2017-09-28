//
//  BounceButton.swift
//  Calculator
//
//  Created by David on 2017-09-28.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class BounceButton: UIButton {
    var color = UIColor.black
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        color = self.backgroundColor!
        
        var red:   CGFloat = 0
        var green: CGFloat = 0
        var blue:  CGFloat = 0
        var alpha: CGFloat = 0
        // get color
        self.backgroundColor?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        // darken color
        
        self.backgroundColor = UIColor(colorLiteralRed: Float(red)-0.2,
                                       green: Float(green)-0.2,
                                       blue: Float(blue)-0.2, alpha: Float(alpha))
        //print(Float(red))
        //print(Float(green))
        //print(Float(blue))
        
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
        self.transform = CGAffineTransform.identity}, completion: nil)
        
        super.touchesBegan(touches,with:event)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backgroundColor = color
        super.touchesEnded(touches, with: event)
    }
    

}
