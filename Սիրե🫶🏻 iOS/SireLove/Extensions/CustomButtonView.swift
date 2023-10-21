//
//  CustomButtonView.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 07.09.23.
//

import UIKit

class CustomButtonView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        var lastButton: UIButton? = nil
        var previousRowButton: UIButton? = nil
        
        for i in 0...5 {
            let button = UIButton()
            button.backgroundColor = UIColor.green
            button.setTitle("Button \(i)", for: .normal)
            button.sizeToFit()
            button.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(button)
            let viewComponents: [String: Any] = ["button": button]
            
            if i % 3 == 0 {
                // Start a new row
                let horizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[button]", options: [], metrics: nil, views: viewComponents)
                let verticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:[previousRowButton]-(8)-[button]", options: [], metrics: nil, views: ["button": button, "previousRowButton": previousRowButton ?? UIView()])
                
                addConstraints(horizontalConstraint)
                addConstraints(verticalConstraint)
                previousRowButton = button
            } else {
                // Add to the same row
                let horizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "[lastButton]-(8)-[button]", options: [], metrics: nil, views: viewComponents)
                
                addConstraints(horizontalConstraint)
            }
            
            layoutIfNeeded()
            lastButton = button
        }
    }
}
