//
//  HomeLevel.swift
//  fortis_app
//
//  Created by Melisa on 10.11.21.
//

import UIKit

extension HomeViewController {
    
    func setupLevel() {
        
        let lvlLabel = UILabel()
        
        levelView.addSubview(lvlLabel)
        lvlLabel.text = "Level 1"
        lvlLabel.font = .systemFont(ofSize: 50, weight: .bold)
        lvlLabel.translatesAutoresizingMaskIntoConstraints = false
        lvlLabel.topAnchor.constraint(equalTo: levelView.topAnchor, constant: 30).isActive = true
        lvlLabel.leadingAnchor.constraint(equalTo: levelView.leadingAnchor, constant: 40).isActive = true
        
        let rewardImage = UIImageView()
        levelView.addSubview(rewardImage)
        rewardImage.image = UIImage(named: "shirt_blue")
        rewardImage.translatesAutoresizingMaskIntoConstraints = false
        rewardImage.centerYAnchor.constraint(equalTo: lvlLabel.centerYAnchor).isActive = true
        rewardImage.centerXAnchor.constraint(equalTo: levelView.trailingAnchor, constant: -80).isActive = true
        
        let lvlBar = UIView()
        
        levelView.addSubview(lvlBar)
        lvlBar.backgroundColor = .black.withAlphaComponent(0.1)
        lvlBar.translatesAutoresizingMaskIntoConstraints = false
        lvlBar.heightAnchor.constraint(equalToConstant: 24).isActive = true
        lvlBar.widthAnchor.constraint(equalTo: levelView.widthAnchor, multiplier: 0.8).isActive = true
        lvlBar.centerXAnchor.constraint(equalTo: levelView.centerXAnchor).isActive = true
        lvlBar.centerYAnchor.constraint(equalTo: levelView.centerYAnchor, constant: 50).isActive = true
        lvlBar.layer.cornerRadius = 12
        lvlBar.layer.borderWidth = 2
        lvlBar.layer.borderColor = UIColor.black.cgColor
        
        let barLabel = UILabel()
        
        levelView.addSubview(barLabel)
        barLabel.text = "50"
        barLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        barLabel.translatesAutoresizingMaskIntoConstraints = false
        barLabel.trailingAnchor.constraint(equalTo: lvlBar.trailingAnchor).isActive = true
        barLabel.centerYAnchor.constraint(equalTo: lvlBar.topAnchor, constant: -20).isActive = true
        
        let startLabel = UILabel()
        
        levelView.addSubview(startLabel)
        startLabel.text = "0"
        startLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        startLabel.leadingAnchor.constraint(equalTo: lvlBar.leadingAnchor).isActive = true
        startLabel.centerYAnchor.constraint(equalTo: lvlBar.topAnchor, constant: -20).isActive = true
        
        let lvlProgress = UIView()
        
        lvlBar.addSubview(lvlProgress)
        lvlProgress.backgroundColor = .black
        lvlProgress.translatesAutoresizingMaskIntoConstraints = false
        lvlProgress.heightAnchor.constraint(equalTo: lvlBar.heightAnchor).isActive = true
        lvlProgress.widthAnchor.constraint(equalTo: lvlBar.widthAnchor, multiplier: 0.2).isActive = true
        lvlProgress.leadingAnchor.constraint(equalTo: lvlBar.leadingAnchor).isActive = true
        lvlProgress.centerYAnchor.constraint(equalTo: lvlBar.centerYAnchor).isActive = true
        lvlProgress.layer.cornerRadius = 12
        
        let progressLabel = UILabel()
        
        levelView.addSubview(progressLabel)
        progressLabel.text = "10"
        progressLabel.textColor = .white
        progressLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.trailingAnchor.constraint(equalTo: lvlProgress.trailingAnchor, constant: -10).isActive = true
        progressLabel.centerYAnchor.constraint(equalTo: lvlProgress.centerYAnchor).isActive = true
        
    }
}
