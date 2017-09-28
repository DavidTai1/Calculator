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
        self.backgroundColor = UIColor.darkGray
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
