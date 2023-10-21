//
//  UILabel + Extension.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 18.08.23.
//

import UIKit.UILabel

extension UILabel {
    convenience init(text: String,
                     font: UIFont? = .init(name: "SFProDisplay-Medium", size: 28)) {
        self.init()
        self.text = text
        self.font = font
    }
}
