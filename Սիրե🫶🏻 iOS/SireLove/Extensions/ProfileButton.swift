//
//  ProfileButton.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 06.09.23.
//

import UIKit

class ProfileButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        let shadows = UIView(frame: bounds)
        shadows.clipsToBounds = false
        addSubview(shadows)

        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 4
        layer0.shadowOffset = CGSize(width: 0, height: 3)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)

        let shapes = UIView(frame: bounds)
        shapes.clipsToBounds = true
        addSubview(shapes)

        if let image1 = UIImage(named: "profilePic")?.cgImage {
            let layer1 = CALayer()
            layer1.contents = image1
//            layer1.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0, c: 0, d: 1.5, tx: 0, ty: -0.08))
            layer1.bounds = shapes.bounds
            layer1.position = shapes.center
            shapes.layer.addSublayer(layer1)
        }

        backgroundColor = .clear
        setTitleColor(.black, for: .normal)
    }
}
