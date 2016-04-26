//
//  extension.swift
//  mixhummy
//
//  Created by shota_todoroki on 4/26/16.
//  Copyright © 2016 shota_todoroki. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func rgb(r r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}
