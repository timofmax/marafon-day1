//
//  ColorAndShadowButton.swift
//  marafon-day1
//
//  Created by Timofey Privalov on 01.03.2023.
//

import UIKit

class ColorAndShadowButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        common()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        common()
    }
    
    private func common() {
        // UIButton is tricky: you MUST set the clear bg in bringup;  NOT in layout
        backgroundColor = .clear
        clipsToBounds = false
        layer.insertSublayer(colorAndShadow, below: layer)
    }
    
    lazy var colorAndShadow: CAShapeLayer = {
        let s = CAShapeLayer()
        s.fillColor = UIColor.black.cgColor
        // set your button color HERE (NOT on storyboard)
        
        let gradient = CAGradientLayer()
        gradient.frame = layer.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.colors = [UIColor.blue.cgColor,
                           UIColor.purple.cgColor,
                           UIColor.red.cgColor]
        
        
        
        //       layer.insertSublayer(gradient, at: 0)
        //
        
        // now set your shadow color/values
        s.shadowColor = UIColor.black.cgColor
        s.shadowOffset = CGSize(width: 0, height: 10)
        s.shadowOpacity = 1
        s.shadowRadius = 10
        
        
        
        // now add the shadow
        layer.insertSublayer(s, at: 0)
        return s
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // you MUST layout these two EVERY layout cycle:
        colorAndShadow.frame = bounds
        colorAndShadow.path = UIBezierPath(roundedRect: bounds, cornerRadius: 12).cgPath
    }
}
