//
//  LevelViewController.swift
//  fortis_app
//
//  Created by Melisa on 01.11.21.
//

import UIKit

class LevelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var lvlView = UIView()
    
    var lvlList = UITableView()
    
    var images: [UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //view.backgroundColor = .red
        setupNavigationBarItems()
        
         images =
         [UIImage(named: "shirt_blue")!,
         UIImage(named: "shirt_red")!,
         UIImage(named: "jeans_blue")!,
         UIImage(named: "jeans_red")!,
         UIImage(named: "overall_blue")!,
         UIImage(named: "overall_red")!,
         UIImage(named: "button_blue")!,
         UIImage(named: "button_red")!,
         UIImage(named: "jogger_blue")!,
         UIImage(named: "jogger_red")!,
         UIImage(named: "dress_blue")!,
         UIImage(named: "dress_red")!]
        
        setupLvL()
    }
    
    func setupLvL() {
        
        view.addSubview(lvlView)
        lvlView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 1, widthMultiplier: 1)
        lvlView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        lvlView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        lvlView.backgroundColor = .clear
        //lvlView.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        //lvlView.layer.cornerRadius = 10
        
        lvlView.addSubview(lvlList)
        lvlList.anchor(height: lvlView.heightAnchor, width: lvlView.widthAnchor, heightMultiplier: 1, widthMultiplier: 1)
        lvlList.centerXAnchor.constraint(equalTo: lvlView.centerXAnchor).isActive = true
        lvlList.topAnchor.constraint(equalTo: lvlView.topAnchor, constant: 10).isActive = true
        //datesView.layer.cornerRadius = 10
        lvlList.backgroundColor = .clear
        lvlList.separatorStyle = .none
        lvlList.allowsSelection = false
        
        lvlList.dataSource = self
        lvlList.delegate = self
        lvlList.rowHeight = 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let subCell = UIView()
        
        cell.addSubview(subCell)
        cell.backgroundColor = .clear
        subCell.backgroundColor = .white
        subCell.layer.cornerRadius = 10
        subCell.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        subCell.translatesAutoresizingMaskIntoConstraints = false
        subCell.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier:  0.95).isActive = true
        subCell.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 0.95).isActive = true
        subCell.center(centerX: cell.centerXAnchor, centerY: cell.centerYAnchor)
        
        let lvlLabel = UILabel()
        
        subCell.addSubview(lvlLabel)
        lvlLabel.text = String(indexPath.row+1)
        lvlLabel.font = .systemFont(ofSize: 35, weight: .semibold)
        lvlLabel.translatesAutoresizingMaskIntoConstraints = false
        lvlLabel.centerYAnchor.constraint(equalTo: subCell.centerYAnchor).isActive = true
        lvlLabel.centerXAnchor.constraint(equalTo: subCell.leadingAnchor, constant: 80).isActive = true
        
        if indexPath.row == 0 {
            setupProgressCircles(cell: cell, subCell: subCell, completed: 0.2)
            setupLevelPoints(subCell: subCell, points: 10)
        }
        else {
            setupProgressCircles(cell: cell, subCell: subCell, completed: 0)
            setupLevelPoints(subCell: subCell, points: 0)
        }
        
        let rewardImage = UIImageView()
        subCell.addSubview(rewardImage)
        rewardImage.image = images[indexPath.row]
        rewardImage.alpha = 0.6
        rewardImage.contentMode = .scaleAspectFill
        rewardImage.anchor(height: subCell.heightAnchor, width: subCell.heightAnchor, heightMultiplier: 0.4, widthMultiplier: 0.4)
        rewardImage.centerYAnchor.constraint(equalTo: subCell.centerYAnchor).isActive = true
        rewardImage.trailingAnchor.constraint(equalTo: subCell.trailingAnchor, constant: -20).isActive = true
        /*
        let lockedReward = UIImageView()
        subCell.addSubview(lockedReward)
        lockedReward.image = UIImage(named: "locked")
        lockedReward.contentMode = .scaleAspectFill
        lockedReward.anchor(height: rewardImage.heightAnchor, width: rewardImage.heightAnchor, heightMultiplier: 0.5, widthMultiplier: 0.5)
        lockedReward.center(centerX: rewardImage.centerXAnchor, centerY: rewardImage.centerYAnchor)
         */
        
        return cell
    }
    
    func setupLevelPoints(subCell: UIView, points: Int) {
        
        let pointsLabel = UILabel()
        subCell.addSubview(pointsLabel)
        pointsLabel.text = "\(points) / 50"
        pointsLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.trailingAnchor.constraint(equalTo: subCell.centerXAnchor, constant: 60).isActive = true
        pointsLabel.centerYAnchor.constraint(equalTo: subCell.centerYAnchor).isActive = true
        
    }
    
    func setupProgressCircles(cell: UITableViewCell, subCell: UIView, completed: CGFloat) {
        
        let pos = CGPoint(x: cell.frame.size.width/4, y: cell.frame.size.height*2.1)
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 60, startAngle: -(CGFloat.pi / 2), endAngle: (2 * CGFloat.pi) - (CGFloat.pi / 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        subCell.layer.addSublayer(shapeLayer)
        shapeLayer.position = pos
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.black.withAlphaComponent(0.2).cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        let lvlPath = UIBezierPath(arcCenter: .zero, radius: 60, startAngle: -(CGFloat.pi / 2), endAngle: (2*completed * CGFloat.pi) - (CGFloat.pi / 2), clockwise: true)
        
        let trackLayer = CAShapeLayer()
        subCell.layer.addSublayer(trackLayer)
        trackLayer.position = pos
        trackLayer.path = lvlPath.cgPath
        trackLayer.strokeColor = UIColor.black.cgColor
        trackLayer.lineWidth = 10
        trackLayer.lineCap = CAShapeLayerLineCap.round
        trackLayer.fillColor = UIColor.clear.cgColor
        
    }
    
    func setupNavigationBarItems() {
        navigationItem.title = "LEVEL"
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(segueDiary(sender:)))
    }
    
    

}
