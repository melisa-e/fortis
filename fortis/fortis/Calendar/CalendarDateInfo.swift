//
//  CalenderDateInfo.swift
//  fortis_app
//
//  Created by Melisa on 08.11.21.
//

import UIKit

extension CalendarViewController {
    

    func setupDateInfoView() {
        
        view.addSubview(dateInfoView)
        dateInfoView.backgroundColor = .white
        dateInfoView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.15, widthMultiplier: 0.95)
        dateInfoView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        dateInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 10).isActive = true
        dateInfoView.layer.cornerRadius = 10
        dateInfoView.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        
        dateInfoView.addSubview(dateTime)
        dateTime.translatesAutoresizingMaskIntoConstraints = false
        dateTime.centerXAnchor.constraint(equalTo: dateInfoView.centerXAnchor).isActive = true
        dateTime.centerYAnchor.constraint(equalTo: dateInfoView.centerYAnchor, constant: -15).isActive = true
        
        dateInfoView.addSubview(dateType)
        dateType.translatesAutoresizingMaskIntoConstraints = false
        dateType.centerXAnchor.constraint(equalTo: dateInfoView.centerXAnchor).isActive = true
        dateType.centerYAnchor.constraint(equalTo: dateInfoView.centerYAnchor, constant: 15).isActive = true
        
        dateInfoView.addSubview(noDateInfo)
        noDateInfo.translatesAutoresizingMaskIntoConstraints = false
        noDateInfo.center(centerX: dateInfoView.centerXAnchor, centerY: dateInfoView.centerYAnchor)
        
        setDateInfo(i: 0)
        
    }
}

