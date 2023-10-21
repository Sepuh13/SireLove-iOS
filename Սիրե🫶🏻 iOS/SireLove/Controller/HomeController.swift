//
//  HomeController.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 04.09.23.
//

import UIKit

final class HomeController: UIViewController {
    
    private let searchBar = SearchBarTF(frame: CGRect(x: 0, y: 0, width: 362, height: 53))
    private let topView = UIView()
    private let headerLabel = UILabel()
    private let notifyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Notify"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        return button
    }()
    private let profileButton = ProfileButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
    private let exploreLabel = UILabel()
    private let mapButton = MapButton()
    private let customView = CustomButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        
        setupConstraints()
    }
    
}

//MARK: Setup UI & Constraints
extension HomeController {
    
    private func setupUI() {
        topView.frame = CGRect(x: 0, y: 0, width: 393, height: 130)
        
        let layer = CAGradientLayer()
        layer.colors = [ UIColor.topViewFGradient().cgColor,
                         UIColor.topViewSGradient().cgColor ]
        layer.locations = [0, 1]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: 0.0, ty: 0.0))
        layer.bounds = topView.bounds.insetBy(dx: -0.5*topView.bounds.size.width,
                                           dy: -0.5*topView.bounds.size.height)
        layer.position = topView.center
        topView.layer.addSublayer(layer)
        
        headerLabel.frame = CGRect(x: 0, y: 0, width: 215, height: 41)
        headerLabel.textColor = .white
        headerLabel.font = UIFont(name: "SFProDisplay-Bold", size: 30)
        headerLabel.text = "Explore the city"
        
        exploreLabel.frame = CGRect(x: 0, y: 0, width: 192, height: 20)
        exploreLabel.textColor = UIColor(red: 0.157, green: 0.165, blue: 0.18, alpha: 0.9)
        exploreLabel.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        exploreLabel.text = "Explore location near you"
    }

    private func setupConstraints() {
        topView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        notifyButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        exploreLabel.translatesAutoresizingMaskIntoConstraints = false
        mapButton.translatesAutoresizingMaskIntoConstraints = false
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topView)
        view.addSubview(searchBar)
        topView.addSubview(headerLabel)
        topView.addSubview(notifyButton)
        topView.addSubview(profileButton)
        view.addSubview(exploreLabel)
        view.addSubview(mapButton)
        view.addSubview(customView)
        

        NSLayoutConstraint.activate([
            searchBar.widthAnchor.constraint(equalToConstant: 362),
            searchBar.heightAnchor.constraint(equalToConstant: 53),
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.5),
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 159)
        ])

        NSLayoutConstraint.activate([
            topView.widthAnchor.constraint(equalToConstant: 393),
            topView.heightAnchor.constraint(equalToConstant: 187),
            topView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.bottomAnchor.constraint(equalTo: searchBar.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerLabel.widthAnchor.constraint(equalToConstant: 215),
            headerLabel.heightAnchor.constraint(equalToConstant: 41),
            headerLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16),
            headerLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 81)
            
        ])
        
        NSLayoutConstraint.activate([
            notifyButton.widthAnchor.constraint(equalToConstant: 28),
            notifyButton.heightAnchor.constraint(equalToConstant: 28),
            notifyButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 305),
            notifyButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 87)
        ])
        NSLayoutConstraint.activate([
            profileButton.widthAnchor.constraint(equalToConstant: 32),
            profileButton.heightAnchor.constraint(equalToConstant: 32),
            profileButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16),
            profileButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 87)
            
        ])
        
        NSLayoutConstraint.activate([
            exploreLabel.widthAnchor.constraint(equalToConstant: 192),
            exploreLabel.heightAnchor.constraint(equalToConstant: 20),
            exploreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            exploreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 247)
        ])
        
        NSLayoutConstraint.activate([
            mapButton.widthAnchor.constraint(equalToConstant: 91),
            mapButton.heightAnchor.constraint(equalToConstant: 38),
            mapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 259),
            mapButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 238)
        ])
        
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            customView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300)
        ])
    }
}

//MARK: - SwiftUI
import SwiftUI

struct HomeVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<HomeVCProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: HomeVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<HomeVCProvider.ContainerView>) {
        }
    }
}
