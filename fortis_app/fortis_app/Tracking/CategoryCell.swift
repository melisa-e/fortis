//
//  CategoryCell.swift
//  fortis_app
//
//  Created by Melisa on 03.11.21.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "buttonCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let buttonCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "      category"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setupViews() {
        backgroundColor = .red
        self.layer.cornerRadius = 10
        
        addSubview(buttonCollectionView)
        addSubview(categoryLabel)
        
        buttonCollectionView.dataSource = self
        buttonCollectionView.delegate = self
        
        buttonCollectionView.register(ButtonCell.self, forCellWithReuseIdentifier: cellId)
        
        buttonCollectionView.anchor(height: self.heightAnchor, width: self.widthAnchor, heightMultiplier: 0.7, widthMultiplier: 1)
        buttonCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        categoryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
}

class ButtonCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.contentMode = .scaleAspectFill
        btn.layer.cornerRadius = 40
        btn.layer.masksToBounds = true
        return btn
    }()
    
    func setupViews() {
        addSubview(button)
        
        button.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
    }
    
}
