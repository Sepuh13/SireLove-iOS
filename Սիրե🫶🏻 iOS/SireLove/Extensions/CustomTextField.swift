//
//  UITextFiekld .swift
//  SireLove
//
//  Created by Er Baghdasaryan on 30.08.23.
//

import Foundation
import UIKit

final class CustomTextField: UITextField {
    
    private var isTextVisible: Bool = false
    private let eyeButton = UIButton()
    
    convenience init(placeholder: String, addEye: Bool = false) {
        self.init()
        self.placeholder = placeholder
        
        frame = CGRect(x: 0, y: 0, width: 361, height: 44)
        backgroundColor = .white
        borderStyle = .none
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.mainGray().cgColor
        textColor = UIColor.mainBlack()
        font = UIFont(name: "SFProDisplay-Regular", size: 13)

        if addEye {
            eyeButton.setImage(UIImage(named: "Eye.slash"), for: .normal)
            isSecureTextEntry = true
            eyeButton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
            rightView = eyeButton
            rightView?.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            rightViewMode = .always
        }
    }
    
    
    @objc func eyeButtonTapped() {
        if isTextVisible == false {
            eyeButton.setImage(UIImage(named: "Eye"), for: .normal)
            isSecureTextEntry = false
            isTextVisible = true
        } else {
            eyeButton.setImage(UIImage(named: "Eye.slash"), for: .normal)
            isSecureTextEntry = true
            isTextVisible = false
        }
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= 16
        return rect
    }
}
