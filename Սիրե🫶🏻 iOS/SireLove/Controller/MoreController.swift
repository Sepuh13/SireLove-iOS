//
//  MoreController.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 04.09.23.
//

import UIKit

final class MoreController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}

//MARK: - SwiftUI
import SwiftUI

struct MoreVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MoreVCProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: MoreVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MoreVCProvider.ContainerView>) {
        }
    }
}
