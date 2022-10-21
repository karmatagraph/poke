//
//  UIFont+Extension.swift
//  pokedex
//
//  Created by karma on 21/10/2022.
//

import Foundation
import UIKit

extension UIFont {
    static func scriptFont(size: CGFloat) -> UIFont {
      guard let customFont = UIFont(name: "Roboto-Regular", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }
}
