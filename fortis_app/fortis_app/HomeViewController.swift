//
//  HomeViewController.swift
//  fortis_app
//
//  Created by Melisa on 01.11.21.
//

import UIKit

class HomeViewController: UIViewController {

    let btnDiaryEntry = UIButton()
    
    let calenderView = UIView()
    let middleView = UIView()
    let levelView = UIView()
    let missionView = UIView()
    let btnView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarItems()
        
        setupEntryButton()
        
        setupSubViews()
        
        
    }
    
    // SETUP NAVIGATIONBAR
    
    func setupNavigationBarItems() {
        navigationItem.title = "fortis"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(segueDiary(sender:)))
    }
    
    
    //SETUP SUBVIEWS
    
    func setupSubViews(){
        view.addSubview(calenderView)
        view.addSubview(middleView)
        middleView.addSubview(levelView)
        middleView.addSubview(missionView)
        view.addSubview(btnView)
        
        calenderView.backgroundColor = .brown
        calenderView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.19, widthMultiplier: 0.95)
        calenderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        calenderView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        middleView.backgroundColor = .green
        middleView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.6, widthMultiplier: 0.95)
        middleView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        middleView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        levelView.anchor(top: middleView.topAnchor, leading: middleView.leadingAnchor, bottom: middleView.centerYAnchor, trailing: middleView.trailingAnchor, topPadding: 0, leadingPadding: 0, bottomPadding: -5, trailingPadding: 0)
        levelView.backgroundColor = .systemPink
        levelView.layer.cornerRadius = 20
        
        missionView.anchor(top: middleView.centerYAnchor, leading: middleView.leadingAnchor, bottom: middleView.bottomAnchor, trailing: middleView.trailingAnchor, topPadding: 5, leadingPadding: 0, bottomPadding: 0, trailingPadding: 0)
        missionView.backgroundColor = .orange
        missionView.layer.cornerRadius = 20
        
        btnView.backgroundColor = .blue
        btnView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.19, widthMultiplier: 0.95)
        btnView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        btnView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        let gestureCalender = UITapGestureRecognizer(target: self, action:  #selector (segueCalender(sender:)))
        self.calenderView.addGestureRecognizer(gestureCalender)
        
        let gestureLevel = UITapGestureRecognizer(target: self, action:  #selector (segueLevel(sender:)))
        
        self.levelView.addGestureRecognizer(gestureLevel)
        
        /*
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (segueDiaryEntry(sender:)))
        self.btnView.addGestureRecognizer(gesture)
         */
        
    }
    
    func setupEntryButton() {
        btnDiaryEntry.setTitle("diary entry", for: .normal)
        btnDiaryEntry.backgroundColor = .black
        btnDiaryEntry.layer.cornerRadius = 20
        btnView.addSubview(btnDiaryEntry)
        
        btnDiaryEntry.anchor(height: btnView.heightAnchor, width: btnView.widthAnchor, heightMultiplier: 0.5, widthMultiplier: 0.4)
        btnDiaryEntry.centerXAnchor.constraint(equalTo: btnView.centerXAnchor).isActive = true
        btnDiaryEntry.centerYAnchor.constraint(equalTo: btnView.centerYAnchor).isActive = true
        btnDiaryEntry.addTarget(self, action: #selector(segueDiaryEntry(sender:)), for: .touchUpInside)
    }
    
    @objc func segueDiaryEntry(sender: UIButton) {
        self.performSegue(withIdentifier: "DiaryEntrySegue", sender: sender)
    }
    
    @objc func segueDiary(sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "DiarySegue", sender: sender)
    }
    
    @objc func segueCalender(sender: UIButton) {
        self.performSegue(withIdentifier: "CalenderSegue", sender: sender)
    }
    
    @objc func segueLevel(sender: UIButton) {
        self.performSegue(withIdentifier: "LevelSegue", sender: sender)
    }


    @IBAction func unwindToHome(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
}
