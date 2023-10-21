//
//  ViewController.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 18.08.23.
//

import UIKit
import CoreLocation

final class LocationViewController: UIViewController {
    
    public let locationManager = CLLocationManager()
    private let geoCoder = CLGeocoder()
    
    private let locationIcon = UIImageView(image: UIImage(named: "LocationIcon"))
    private let firstImage = UIImageView(image: UIImage(named: "FirstImage"))
    private let secondImage = UIImageView(image: UIImage(named: "SecondImage"))
    private let locationSwith = UIImageView(image: UIImage(named: "LocationSwitch"))
    private let enableLabel = UILabel()
    private let sireLoveTL = UILabel()
    private let textLabel = UILabel()
    private let gotItButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ok, I got it", for: .normal)
        button.titleLabel?.frame =  CGRect(x: 0, y: 0, width: 72, height: 19)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .init(name:  "SFProDisplay-Bold", size: 16)
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstrainst()
        view.backgroundColor = .white
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        gotItButton.addTarget(self, action: #selector(gotItTapped), for: .touchUpInside)
    }
    
    @objc private func gotItTapped() {
        let status = locationManager.authorizationStatus
        
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            let nextVC = LoginVIewController()
            nextVC.modalPresentationStyle = .fullScreen
            
            present(nextVC, animated: true)
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            showLocationAlert()
        @unknown default:
            break
        }
    }
}

//MARK: Setup UI, Constraints
extension LocationViewController {
    
    private func setupUI() {
        
        firstImage.frame = CGRect(x: 0, y: 0, width: 393, height: 126)
        let firstLayer = CALayer()
        firstLayer.contents = firstImage.image
        firstLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0, c: 0, d: 1.04, tx: 0, ty: -0.02))
        firstLayer.bounds = firstImage.bounds
        firstLayer.position = firstImage.center
        firstImage.layer.addSublayer(firstLayer)
        
        secondImage.frame = CGRect(x: 0, y: 0, width: 247.84, height: 167)
        
        locationIcon.frame = CGRect(x: 0, y: 0, width: 31.93, height: 43.23)
        
        locationSwith.frame = CGRect(x: 0, y: 0, width: 56.11, height: 20.37)
        
        enableLabel.frame = CGRect(x: 0, y: 0, width: 193, height: 28)
        enableLabel.textColor = .mainBlack()
        enableLabel.font = UIFont(name: "SFProDisplay-Medium", size: 28)
        enableLabel.text = "Enable Location"
        
        
        sireLoveTL.frame = CGRect(x: 0, y: 0, width: 233, height: 14)
        sireLoveTL.textColor = .mainBlack()
        sireLoveTL.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        sireLoveTL.text = "SireLove works way better with location on."
        
        textLabel.frame = CGRect(x: 0, y: 0, width: 361, height: 42)
        textLabel.textColor = UIColor(red: 0.157, green: 0.165, blue: 0.18, alpha: 0.5)
        textLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.textAlignment = .center
        textLabel.text = "We receive your location when you are using the app to search for nearby businesses and give you a better local experience. You can adjust your location settings at any time."
        
        gotItButton.frame = CGRect(x: 0, y: 0, width: 361, height: 44)
        gotItButton.layer.backgroundColor = UIColor.mainBlue().cgColor
        gotItButton.layer.cornerRadius = 4
        
    }
    
    private func setupConstrainst() {
        
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        secondImage.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationSwith.translatesAutoresizingMaskIntoConstraints = false
        enableLabel.translatesAutoresizingMaskIntoConstraints = false
        sireLoveTL.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        gotItButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(firstImage)
        view.addSubview(locationIcon)
        view.addSubview(locationSwith)
        view.addSubview(enableLabel)
        view.addSubview(sireLoveTL)
        view.addSubview(textLabel)
        view.addSubview(gotItButton)
        firstImage.addSubview(secondImage)
        
        NSLayoutConstraint.activate([
            firstImage.widthAnchor.constraint(equalToConstant: 393),
            firstImage.heightAnchor.constraint(equalToConstant: 126),
            firstImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            firstImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            firstImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 351)
        ])
        
        NSLayoutConstraint.activate([
            secondImage.widthAnchor.constraint(equalToConstant: 247.84),
            secondImage.heightAnchor.constraint(equalToConstant: 167),
            secondImage.leadingAnchor.constraint(equalTo: firstImage.leadingAnchor, constant: 68)
        ])
        
        NSLayoutConstraint.activate([
            locationSwith.widthAnchor.constraint(equalToConstant: 56.11),
            locationSwith.heightAnchor.constraint(equalToConstant: 20.37),
            locationSwith.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 169),
            locationSwith.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 465)
        ])
        
        NSLayoutConstraint.activate([
            enableLabel.widthAnchor.constraint(equalToConstant: 193),
            enableLabel.heightAnchor.constraint(equalToConstant: 28),
            enableLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 51),
            enableLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 172)
        ])
        
        NSLayoutConstraint.activate([
            sireLoveTL.widthAnchor.constraint(equalToConstant: 293),
            sireLoveTL.heightAnchor.constraint(equalToConstant: 14),
            sireLoveTL.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 51),
            sireLoveTL.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 214)
        ])
        
        
        NSLayoutConstraint.activate([
            locationIcon.widthAnchor.constraint(equalToConstant: 31.93),
            locationIcon.heightAnchor.constraint(equalToConstant: 43.23),
//            locationIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 83.7),
//            locationIcon.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 49.14),
//            locationIcon.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -715.15),
//            locationIcon.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -290.72)
            locationIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 32.67),
            locationIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -5.68)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.widthAnchor.constraint(equalToConstant: 361),
            textLabel.heightAnchor.constraint(equalToConstant: 42),
            textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 575)
        ])
        
        NSLayoutConstraint.activate([
            gotItButton.widthAnchor.constraint(equalToConstant: 361),
            gotItButton.heightAnchor.constraint(equalToConstant: 44),
            gotItButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            gotItButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            gotItButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 756)
        ])
    }
}

//MARK: Location Delegate
extension LocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied || status == .restricted {
            showLocationAlert()
        }
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        print(locations.first!)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print(newHeading)
    }
    
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        print(visit)
    }
}

//MARK:  Show location alert
extension LocationViewController {
    
    func showLocationAlert() {
        let alert = UIAlertController(
            title: "Location Access Required",
            message: "Please enable location services in settings to proceed.",
            preferredStyle: .alert
        )
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

//MARK: Swift UI

import SwiftUI

struct LocationVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let locationVC = LocationViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LocationVCProvider.ContainerView>) -> LocationViewController {
            return locationVC
        }
        
        func updateUIViewController(_ uiViewController: LocationVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LocationVCProvider.ContainerView>) {
        }
    }
}



