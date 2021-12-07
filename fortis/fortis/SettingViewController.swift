//
//  SettingViewController.swift
//  fortis
//
//  Created by Melisa on 14.11.21.
//

import UIKit

class SettingViewController: UIViewController {
    
    let notificationView = UIView()
    let infoView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(notificationView)
        view.addSubview(infoView)
        
        notificationView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.48, widthMultiplier: 0.95)
        notificationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        notificationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        notificationView.layer.cornerRadius = 10
        notificationView.backgroundColor = .white
        notificationView.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        
        infoView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.48, widthMultiplier: 0.95)
        infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoView.topAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: 10).isActive = true
        infoView.layer.cornerRadius = 10
        infoView.backgroundColor = .white
        infoView.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
    }
    


}
