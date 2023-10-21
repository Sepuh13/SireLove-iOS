//
//  UIButton + Extension.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 31.08.23.
//

import UIKit.UIButton

extension UIButton {
    
    convenience init(image: UIImage, title: String) {
        self.init(type: .system)
        
        setImage(image, for: .normal)
        setTitle(title, for: .normal)
        
        
    }
    
    func addGoogleIcon() {
        let googleLogo = UIImageView(image: .init(named: "Google"), contentMode: .scaleAspectFit)
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(googleLogo)
        googleLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44).isActive = true
        googleLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        googleLogo.widthAnchor.constraint(equalToConstant: 24).isActive = true
        googleLogo.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
    
    func addAppleIcon() {
        let googleLogo = UIImageView(image: .init(named: "Apple"), contentMode: .scaleAspectFit)
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(googleLogo)
        googleLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44).isActive = true
        googleLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        googleLogo.widthAnchor.constraint(equalToConstant: 24).isActive = true
        googleLogo.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
}
