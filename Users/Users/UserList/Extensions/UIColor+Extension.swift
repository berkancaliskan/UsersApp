//
//  UIColor+Extension.swift
//  Users
//
//  Created by Berkan Çalışkan on 19.02.2025.
//

import UIKit

extension UIColor {
    // A variable has been added to return contrasting colors so that the initials of the names and the background are not similar colors.
    static var contrastings: (UIColor, UIColor) {
        let red = Int.random(in: 0...255)
        let green = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)
        
        let primaryColor = UIColor(red: CGFloat(red) / 255.0,
                                   green: CGFloat(green) / 255.0,
                                   blue: CGFloat(blue) / 255.0,
                                   alpha: 1.0)
        
        let complementaryColor = UIColor(red: CGFloat(255 - red) / 255.0,
                                         green: CGFloat(255 - green) / 255.0,
                                         blue: CGFloat(255 - blue) / 255.0,
                                         alpha: 1.0)
        
        return (primaryColor, complementaryColor)
    }
}
