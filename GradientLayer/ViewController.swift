//
//  ViewController.swift
//  GradientLayer
//
//  Created by Jae Lee on 5/7/19.
//  Copyright © 2019 Jae Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        

        let subView = UIView()
        subView.backgroundColor = .blue
        subView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        subView.center = self.view.center
        subView.applyGradientAnimation()
        view.addSubview(subView)
        
        
    }


}


extension UIView {
    func applyGradientAnimation() {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        let gray1 = UIColor(fromHexValue: "E7E7E7").cgColor
        let gray2 = UIColor(fromHexValue: "E8E8E8").cgColor
        let gray3 = UIColor(fromHexValue: "F2F2F2").cgColor
        
        gradient.colors = [gray1 as Any, gray2 as Any, gray3 as Any]
        gradient.locations =  [0.0, 0.05, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.1, 0.05, 0.3]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.duration = 0.8
        animation.autoreverses = false
        animation.repeatCount = Float.infinity
        gradient.add(animation, forKey: nil)
        
        self.layer.addSublayer(gradient)
    }
    
}

extension UIColor {
    convenience init(fromHexValue: String) {
        var chars = Array(fromHexValue.hasPrefix("#") ? fromHexValue.dropFirst() : fromHexValue[...])
        var red:CGFloat = 0
        var green:CGFloat = 0
        var blue:CGFloat = 0
        var alpha:CGFloat = 0
        switch chars.count {
        case 3:
            chars = chars.flatMap { [$0, $0] }
            fallthrough
        case 6:
            chars = ["F","F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            print("nil")
        }
        self.init(red: red, green: green, blue:  blue, alpha: alpha)
    }
}
