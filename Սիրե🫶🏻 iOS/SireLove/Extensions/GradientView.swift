//
//  GradientView.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 05.09.23.
//

import UIKit

class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    convenience init() {
        self.init()
        self.frame = CGRect(x: 0, y: 0, width: 393, height: 187)
        gradientLayer.colors = [ UIColor.topViewFGradient().cgColor,
                         UIColor.topViewSGradient().cgColor ]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: 0.0, ty: 0.0))
        gradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width,
                                           dy: -0.5*self.bounds.size.height)
        gradientLayer.position = self.center
        self.layer.addSublayer(gradientLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
