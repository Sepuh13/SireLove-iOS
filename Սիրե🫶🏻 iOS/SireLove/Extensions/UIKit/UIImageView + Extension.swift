//
//  UIImageView + Extension.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 31.08.23.
//

import UIKit.UIImageView

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
        
    }
}
