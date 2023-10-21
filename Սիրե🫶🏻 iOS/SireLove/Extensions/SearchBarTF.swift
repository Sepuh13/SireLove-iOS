//
//  SearchBarTF.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 05.09.23.
//

import UIKit

class SearchBarTF: UITextField {
    
   
    private let containerShadows = UIView()
    private let containerShapes = UIView()
    private let searchButton = UIButton()
    private let voiceButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {

        containerShadows.frame = bounds
        containerShadows.clipsToBounds = false
        addSubview(containerShadows)

        let shadowPath0 = UIBezierPath(roundedRect: containerShadows.bounds, cornerRadius: 4)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor.mainGray().cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 0
        layer0.shadowOffset = CGSize(width: 0, height: 1)
        layer0.bounds = containerShadows.bounds
        layer0.position = containerShadows.center
        containerShadows.layer.addSublayer(layer0)
        
        text = "Search for restaurants, services, delivery se..."

        // Set up the shapes container view
        containerShapes.frame = bounds
        containerShapes.clipsToBounds = true
        addSubview(containerShapes)

        // Add background layer to the shapes container view
        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer1.bounds = containerShapes.bounds
        layer1.position = containerShapes.center
        containerShapes.layer.addSublayer(layer1)

        // Set corner radius for the shapes container view
        containerShapes.layer.cornerRadius = 4

        // Configure other properties as needed
        layer.borderWidth = 1
        text = "Search for restaurants, services, delivery se..."
        textColor = UIColor(red: 0.157, green: 0.165, blue: 0.18, alpha: 1)
        font = UIFont(name: "SFProDisplay-Regular", size: 12)
        layer.cornerRadius = 4
        
        
        searchButton.setImage(UIImage(named: "Search"), for: .normal)
        leftView = searchButton
        leftView?.frame = CGRect(x: 0, y: 0, width: 20, height: 21)
        leftViewMode = .always
        
        voiceButton.setImage(UIImage(named: "Voice"), for: .normal)
        rightView = voiceButton
        rightView?.frame = CGRect(x: 0, y: 0, width: 13, height: 21)
        rightViewMode = .always
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 52, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 52, dy: 0)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= 8
        return rect
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 8
        return rect
    }

}
