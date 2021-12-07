//
//  HomeViewController.swift
//  fortis_app
//
//  Created by Melisa on 01.11.21.
//

import UIKit

class HomeViewController: UIViewController {

    let btnDiaryEntry = UIButton()
    let btnCollection = UIButton()
    let btnReview = UIButton()
    
    let calendarView = UIView()
    let middleView = UIView()
    let levelView = UIView()
    let missionView = UIView()
    let btnView = UIView()
    
    var dateStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarItems()
        
        setupEntryButton()
        setupCollectionButton()
        setupReviewButton()
        
        setupSubViews()
        setupCalendarView()
        
        setupLevel()
        setupMissions()
        
    }
    
    // SETUP NAVIGATIONBAR
    
    func setupNavigationBarItems() {
        navigationItem.title = "fortis"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .done, target: self, action: #selector(segueSettings(sender:)))
    }
    
    //SETUP SUBVIEWS
    
    func setupSubViews(){
        view.addSubview(calendarView)
        view.addSubview(middleView)
        middleView.addSubview(levelView)
        middleView.addSubview(missionView)
        view.addSubview(btnView)
        
        calendarView.backgroundColor = .white
        calendarView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.15, widthMultiplier: 0.95)
        //calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        calendarView.bottomAnchor.constraint(equalTo: middleView.topAnchor, constant: -20).isActive = true
        calendarView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        calendarView.layer.cornerRadius = 10
        calendarView.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        
        //middleView.backgroundColor = .green
        middleView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.62, widthMultiplier: 0.95)
        middleView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        middleView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        levelView.anchor(top: middleView.topAnchor, leading: middleView.leadingAnchor, bottom: middleView.centerYAnchor, trailing: middleView.trailingAnchor, topPadding: 0, leadingPadding: 0, bottomPadding: -10, trailingPadding: 0)
        //levelView.backgroundColor = .systemPink
        levelView.backgroundColor = .white
        levelView.layer.cornerRadius = 20
        levelView.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        
        missionView.anchor(top: middleView.centerYAnchor, leading: middleView.leadingAnchor, bottom: middleView.bottomAnchor, trailing: middleView.trailingAnchor, topPadding: 10, leadingPadding: 0, bottomPadding: 0, trailingPadding: 0)
        missionView.backgroundColor = .white
        missionView.layer.cornerRadius = 20
        missionView.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        
        //btnView.backgroundColor = .blue
        btnView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.19, widthMultiplier: 0.95)
        btnView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        btnView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        let gestureCalender = UITapGestureRecognizer(target: self, action:  #selector (segueCalender(sender:)))
        self.calendarView.addGestureRecognizer(gestureCalender)
        
        let gestureLevel = UITapGestureRecognizer(target: self, action:  #selector (segueLevel(sender:)))
        
        self.levelView.addGestureRecognizer(gestureLevel)
        
    }
    
    func setupEntryButton() {
        btnDiaryEntry.backgroundColor = .white
        btnDiaryEntry.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        btnDiaryEntry.layer.cornerRadius = 40
        btnDiaryEntry.setImage(UIImage(named: "plus"), for: .normal)
        btnView.addSubview(btnDiaryEntry)
        
        btnDiaryEntry.contentHorizontalAlignment = .fill
        btnDiaryEntry.contentVerticalAlignment = .fill
        
        btnDiaryEntry.anchor(height: btnView.heightAnchor, width: btnView.heightAnchor, heightMultiplier: 0.6, widthMultiplier: 0.6)
        btnDiaryEntry.centerXAnchor.constraint(equalTo: btnView.centerXAnchor).isActive = true
        btnDiaryEntry.centerYAnchor.constraint(equalTo: btnView.centerYAnchor).isActive = true
        btnDiaryEntry.addTarget(self, action: #selector(segueDiaryEntry(sender:)), for: .touchUpInside)
    }
    
    func setupCollectionButton() {
        
        btnCollection.backgroundColor = .white
        btnCollection.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        btnCollection.layer.cornerRadius = 20
        btnCollection.setImage(UIImage(named: "hanger"), for: .normal)
        btnView.addSubview(btnCollection)
        
        btnCollection.contentHorizontalAlignment = .fill
        btnCollection.contentVerticalAlignment = .fill
        
        btnCollection.anchor(height: btnView.heightAnchor, width: btnView.heightAnchor, heightMultiplier: 0.6, widthMultiplier: 0.6)
        btnCollection.centerXAnchor.constraint(equalTo: btnView.leadingAnchor, constant: 70).isActive = true
        btnCollection.centerYAnchor.constraint(equalTo: btnView.centerYAnchor).isActive = true
        btnCollection.addTarget(self, action: #selector(segueCollection(sender:)), for: .touchUpInside)
    }
    
    func setupReviewButton() {
        
        btnReview.backgroundColor = .white
        btnReview.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        btnReview.layer.cornerRadius = 20
        btnReview.setImage(UIImage(named: "barchart"), for: .normal)
        btnView.addSubview(btnReview)
        
        btnReview.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        //tnReview.contentHorizontalAlignment = .fill
        //btnReview.contentVerticalAlignment = .fill
        
        btnReview.anchor(height: btnView.heightAnchor, width: btnView.heightAnchor, heightMultiplier: 0.6, widthMultiplier: 0.6)
        btnReview.centerXAnchor.constraint(equalTo: btnView.trailingAnchor, constant: -70).isActive = true
        btnReview.centerYAnchor.constraint(equalTo: btnView.centerYAnchor).isActive = true
        btnReview.addTarget(self, action: #selector(segueReview(sender:)), for: .touchUpInside)
    }
    
    @objc func segueSettings(sender: UIButton) {
        self.performSegue(withIdentifier: "SettingsSegue", sender: sender)
    }
    
    @objc func segueReview(sender: UIButton) {
        self.performSegue(withIdentifier: "ReviewSegue", sender: sender)
    }
    
    @objc func segueCollection(sender: UIButton) {
        self.performSegue(withIdentifier: "CollectionSegue", sender: sender)
    }
    
    @objc func segueDiaryEntry(sender: UIButton) {
        self.performSegue(withIdentifier: "DiaryEntrySegue", sender: sender)
    }
    
    @objc func segueDiary(sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "DiarySegue", sender: sender)
    }
    
    @objc func segueCalender(sender: UIButton) {
        self.performSegue(withIdentifier: "CalendarSegue", sender: sender)
    }
    
    @objc func segueLevel(sender: UIButton) {
        self.performSegue(withIdentifier: "LevelSegue", sender: sender)
    }

    @IBAction func unwindToHome(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
}
