//
// Created by Yuhong He on 08/10/2023.
//

import Foundation
import UIKit

extension UIColor {
    static func hexColor(_ hexValue: Int, alpha: Float) -> UIColor {
        return UIColor(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255,
                green: CGFloat((hexValue & 0x00FF00) >> 8) / 255,
                blue: CGFloat((hexValue & 0x0000FF) >> 8) / 255,
                alpha: CGFloat(alpha))
    }

    static func hexColor(_ hexValue: Int) -> UIColor {
        return hexColor(hexValue, alpha: 1)
    }

    convenience init(_ hexValue: Int, alpha: Float) {
        self.init(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255,
                green: CGFloat((hexValue & 0x00FF00) >> 8) / 255,
                blue: CGFloat((hexValue & 0x0000FF) >> 8) / 255,
                alpha: CGFloat(alpha))
    }

    convenience init(_ hexValue: Int) {
        self.init(hexValue, alpha: 1)
    }
}