//
//  MapButton.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 07.09.23.
//

import UIKit

class MapButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        
        frame = CGRect(x: 0, y: 0, width: 91, height: 38)
        let buttonImage = UIImage(named: "locMap")
        setImage(buttonImage, for: .normal)
        setTitle("Map", for: .normal)
        titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 12)
        backgroundColor = .mainBlue()
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 2

    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let bounds = self.bounds
        let imageFrame = CGRect(x: 16, y: (bounds.height - 22.25) / 2, width: 22.25, height: 22.14)
        imageView?.frame = imageFrame

        let textFrame = CGRect(x: imageFrame.maxX + 10, y: 0, width: bounds.width - imageFrame.maxX - 20, height: bounds.height)
        titleLabel?.frame = textFrame
    }
}
