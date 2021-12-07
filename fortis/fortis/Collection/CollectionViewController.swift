//
//  CollectionViewController.swift
//  fortis_app
//
//  Created by Melisa on 11.11.21.
//

import UIKit

class CollectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let collectionView = UIView()
    let collectionList = UITableView()
    var images: [UIImage] = []
    let collectionCategories = ["Oberteil", "Unterteil", "Ganzkörper"]
    let upperImages: [UIImage] = [UIImage(named: "shirt_blue")!, UIImage(named: "shirt_red")!, UIImage(named: "button_blue")!, UIImage(named: "button_red")!]
    let bottomImages: [UIImage] = [UIImage(named: "jeans_blue")!, UIImage(named: "jeans_red")!, UIImage(named: "jogger_blue")!, UIImage(named: "jogger_red")!]
    let overallImages: [UIImage] = [UIImage(named: "overall_blue")!, UIImage(named: "overall_red")!, UIImage(named: "dress_blue")!, UIImage(named: "dress_red")!]
    
    var upperButtons: [UIButton] = []
    var bottomButtons: [UIButton] = []
    var overallButtons: [UIButton] = []
    
    let buttonImages: [[UIImage]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "KOLLEKTION"
        view.addSubview(collectionView)
        
        setupCollection()
    }
    
    func setupCollection() {
        
        view.addSubview(collectionView)
        collectionView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 1, widthMultiplier: 1)
        collectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        collectionView.backgroundColor = .clear
        
        collectionView.addSubview(collectionList)
        collectionList.anchor(height: collectionView.heightAnchor, width: collectionView.widthAnchor, heightMultiplier: 1, widthMultiplier: 1)
        collectionList.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        collectionList.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 10).isActive = true
        //datesView.layer.cornerRadius = 10
        collectionList.backgroundColor = .clear
        collectionList.separatorStyle = .none
        collectionList.allowsSelection = false
        
        collectionList.dataSource = self
        collectionList.delegate = self
        collectionList.rowHeight = 200
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let subCell = UIView()
        
        cell.contentView.addSubview(subCell)
        cell.backgroundColor = .clear
        subCell.backgroundColor = .white
        subCell.layer.cornerRadius = 10
        subCell.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        subCell.translatesAutoresizingMaskIntoConstraints = false
        subCell.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier:  0.95).isActive = true
        subCell.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 0.95).isActive = true
        subCell.center(centerX: cell.centerXAnchor, centerY: cell.centerYAnchor)
        
        let categorieLabel = UILabel()
        
        subCell.addSubview(categorieLabel)
        categorieLabel.text = collectionCategories[indexPath.row]
        categorieLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        categorieLabel.translatesAutoresizingMaskIntoConstraints = false
        categorieLabel.topAnchor.constraint(equalTo: subCell.topAnchor, constant: 20).isActive = true
        categorieLabel.leadingAnchor.constraint(equalTo: subCell.leadingAnchor, constant: 30).isActive = true
        
        let btn1 = UIButton()
        subCell.addSubview(btn1)
        btn1.backgroundColor = .white
        btn1.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        btn1.anchor(height: subCell.widthAnchor, width: subCell.widthAnchor, heightMultiplier: 0.23, widthMultiplier: 0.23)
        btn1.bottomAnchor.constraint(equalTo: subCell.bottomAnchor, constant: -30).isActive = true
        btn1.leadingAnchor.constraint(equalTo: subCell.leadingAnchor, constant: 5).isActive = true
        btn1.layer.cornerRadius = 25
        
        let btn2 = UIButton()
        subCell.addSubview(btn2)
        btn2.backgroundColor = .white
        btn2.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        btn2.anchor(height: subCell.widthAnchor, width: subCell.widthAnchor, heightMultiplier: 0.23, widthMultiplier: 0.23)
        btn2.bottomAnchor.constraint(equalTo: subCell.bottomAnchor, constant: -30).isActive = true
        btn2.trailingAnchor.constraint(equalTo: subCell.centerXAnchor, constant: -3).isActive = true
        btn2.layer.cornerRadius = 25
        
        let btn3 = UIButton()
        subCell.addSubview(btn3)
        btn3.backgroundColor = .white
        btn3.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        btn3.anchor(height: subCell.widthAnchor, width: subCell.widthAnchor, heightMultiplier: 0.23, widthMultiplier: 0.23)
        btn3.bottomAnchor.constraint(equalTo: subCell.bottomAnchor, constant: -30).isActive = true
        btn3.leadingAnchor.constraint(equalTo: subCell.centerXAnchor, constant: 3).isActive = true
        btn3.layer.cornerRadius = 25
        
        let btn4 = UIButton()
        subCell.addSubview(btn4)
        btn4.backgroundColor = .white
        btn4.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        btn4.anchor(height: subCell.widthAnchor, width: subCell.widthAnchor, heightMultiplier: 0.23, widthMultiplier: 0.23)
        btn4.bottomAnchor.constraint(equalTo: subCell.bottomAnchor, constant: -30).isActive = true
        btn4.trailingAnchor.constraint(equalTo: subCell.trailingAnchor, constant: -5).isActive = true
        btn4.layer.cornerRadius = 25
        
        let btns = [btn1, btn2, btn3, btn4]
        
        if indexPath.row == 0 {
            for i in 0...btns.count-1{
                btns[i].setImage(upperImages[i], for: .normal)
                upperButtons.append(btns[i])
                btns[i].addTarget(self, action: #selector(buttonUpper(sender:)), for: .touchUpInside)
            }
        } else if indexPath.row == 1 {
            for i in 0...btns.count-1{
                btns[i].setImage(bottomImages[i], for: .normal)
                bottomButtons.append(btns[i])
                btns[i].addTarget(self, action: #selector(buttonBottom(sender:)), for: .touchUpInside)
            }
        } else if indexPath.row == 2 {
            for i in 0...btns.count-1{
                btns[i].setImage(overallImages[i], for: .normal)
                overallButtons.append(btns[i])
                btns[i].addTarget(self, action: #selector(buttonOverall(sender:)), for: .touchUpInside)
            }
        }
        
        
        return cell
    }
    
    @objc func buttonUpper(sender: UIButton) {
        for i in upperButtons {
            i.layer.borderWidth = 0
        }
        for i in overallButtons {
            i.layer.borderWidth = 0
        }
        
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 2
    }
    
    @objc func buttonBottom(sender: UIButton) {
        for i in bottomButtons {
            i.layer.borderWidth = 0
        }
        for i in overallButtons {
            i.layer.borderWidth = 0
        }
        
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 2
    }
    
    @objc func buttonOverall(sender: UIButton) {
        for i in overallButtons {
            i.layer.borderWidth = 0
        }
        for i in bottomButtons {
            i.layer.borderWidth = 0
        }
        for i in upperButtons {
            i.layer.borderWidth = 0
        }
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 2
    }
    
    
}
