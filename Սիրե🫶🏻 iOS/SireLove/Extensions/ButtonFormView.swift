//
//  ButtonFormView.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 30.08.23.
//

import UIKit

class ButtonFormView: UIView {
    
    init(label: UILabel, textField: UITextField) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        self.addSubview(textField)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        bottomAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
    }
    
    convenience init(label: UILabel, textField: UITextField, button: UIButton) {
        self.init(label: label, textField: textField)
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        button.setTitleColor(.black, for: .normal)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 181.7),
            button.heightAnchor.constraint(equalToConstant: 20),
            button.widthAnchor.constraint(equalToConstant: 108)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
