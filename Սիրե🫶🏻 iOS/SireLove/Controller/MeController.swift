//
//  MeController.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 04.09.23.
//

import UIKit

final class MeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}

//MARK: - SwiftUI
import SwiftUI

struct MeVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MeVCProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: MeVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MeVCProvider.ContainerView>) {
        }
    }
}
