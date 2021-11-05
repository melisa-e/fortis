//
//  CategoryTableViewCell.swift
//  fortis_app
//
//  Created by Melisa on 04.11.21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    var categoryLabel = UILabel()
    var background = UIView()
    var categoryView = UIStackView()
    
    var btnOne = UIButton()
    var btnTwo = UIButton()
    var btnThree = UIButton()
    var btnFour = UIButton()
    var btnFive = UIButton()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(background)
        addSubview(categoryView)
        addSubview(categoryLabel)
        configureStackView()
        setupButton(btn: btnOne, title: "one")
        setupButton(btn: btnTwo, title: "two")
        setupButton(btn: btnThree, title: "three")
        setupButton(btn: btnFour, title: "four")
        setupButton(btn: btnFive, title: "five")
        
        configureBackground()
        configureTitleLabel()
        setTitleConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(btn: UIButton, title: String) {
        btn.setTitle(title, for: .normal)
        btn.backgroundColor = .gray
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 1
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.2
        btn.layer.shadowOffset = CGSize(width: 2, height: 2)
        btn.layer.shadowRadius = 2
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 36
        //btn.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func configureStackView() {
        //categoryView.backgroundColor = .yellow
        categoryView.layer.cornerRadius = 10
        categoryView.anchor(height: heightAnchor, width: widthAnchor, heightMultiplier: 0.42, widthMultiplier: 0.95)
        categoryView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        categoryView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15).isActive = true
        
        categoryView.alignment = .fill
        categoryView.distribution = .fillEqually
        categoryView.spacing = 5
    
    }
    
    func configureBackground() {
        background.backgroundColor = .white
        background.layer.cornerRadius = 10
        //background.layer.borderColor = UIColor.black.cgColor
        //background.layer.borderWidth = 1
        background.layer.shadowColor = UIColor.black.cgColor
        background.layer.shadowOpacity = 0.2
        background.layer.shadowOffset = CGSize(width: 2, height: 2)
        background.layer.shadowRadius = 2
        background.anchor(height: heightAnchor, width: widthAnchor, heightMultiplier: 0.97, widthMultiplier: 0.98)
        background.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        background.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func set(title: String, btn: [UIButton], row: Int){
        categoryLabel.text = title
        categoryLabel.font = .systemFont(ofSize: 21, weight: .bold)
        btnOne.setTitle(btn[0].titleLabel?.text, for: .normal)
        btnTwo.setTitle(btn[1].titleLabel?.text, for: .normal)
        btnThree.setTitle(btn[2].titleLabel?.text, for: .normal)
        btnFour.setTitle(btn[3].titleLabel?.text, for: .normal)
        btnFive.setTitle(btn[4].titleLabel?.text, for: .normal)
        
        
        
        categoryView.addArrangedSubview(btnOne)
        categoryView.addArrangedSubview(btnTwo)
        categoryView.addArrangedSubview(btnThree)
        categoryView.addArrangedSubview(btnFour)
        categoryView.addArrangedSubview(btnFive)
    }
    
    func configureTitleLabel() {
        categoryLabel.numberOfLines = 0
        categoryLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setTitleConstraints() {
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        //categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    }
    
    func setConstraints(trailing: NSLayoutXAxisAnchor) {
        //testLabel.centerXAnchor.constraint(equalTo: top).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailing, constant: -12).isActive = true
    }

}
