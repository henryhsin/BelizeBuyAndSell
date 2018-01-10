//
//  Extension.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 07/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    //static fumc 為了讓其他檔案也可以呼叫這個func
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension UIButton {
    //讓button的backgroundColor根據狀態改變
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    func setBackgroundColor(color: UIColor, forUIControlState state: UIControlState) {
        self.setBackgroundImage(imageWithColor(color: color), for: state)
    }
}
