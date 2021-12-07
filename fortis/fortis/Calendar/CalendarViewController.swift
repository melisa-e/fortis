//
//  CalenderViewController.swift
//  fortis_app
//
//  Created by Melisa on 01.11.21.
//

import UIKit

class CalendarViewController: UIViewController {
    
    var calendarBackground = UIView()
    var calendarStack = UIStackView()
    var monthView = UIView()
    var weekLabel = UIStackView()
    var weekOne = UIStackView()
    var weekTwo = UIStackView()
    var weekThree = UIStackView()
    var weekFour = UIStackView()
    var weekFive = UIStackView()
    
    let monthLabel = UILabel()
    
    var dayButtons: [UIButton] = []
    
    var novCount = Array(0...35)
    
    var dateInfoView = UIView()
    var dateBeginTime = UILabel()
    var dateEndTime = UILabel()
    var dateTime = UILabel()
    var dateType = UILabel()
    var noDateInfo = UILabel()
    
    var noDateBool: Bool = true
    
    var datesView = UIView()
    var datesList = UITableView()
    
    let month = Calendar.current.component(.month, from: Date())
    let date = Calendar.current.component(.day, from: Date())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        
        //*********************** SETUP CALENDER VIEW ***********************
        setupStackView()
        setupMonthLabel()
        setupWeek()
        setupDays()
        
        setupDateInfoView()
        setupDatesList()
    }
    
    func setupDatesList() {
        
        view.addSubview(datesView)
        datesView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.29, widthMultiplier: 0.95)
        datesView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        datesView.topAnchor.constraint(equalTo: dateInfoView.bottomAnchor, constant: 10).isActive = true
        datesView.backgroundColor = .white
        datesView.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        datesView.layer.cornerRadius = 10
        
        
        
        datesView.addSubview(datesList)
        datesList.anchor(height: datesView.heightAnchor, width: datesView.widthAnchor, heightMultiplier: 0.95, widthMultiplier: 1)
        datesList.centerXAnchor.constraint(equalTo: datesView.centerXAnchor).isActive = true
        datesList.topAnchor.constraint(equalTo: datesView.topAnchor).isActive = true
        //datesView.layer.cornerRadius = 10
        //datesList.backgroundColor = .brown
        
        datesList.dataSource = self
        datesList.delegate = self
        datesList.rowHeight = 70
         
        
    }
    
    func setDateInfo(i: Int){
        
        if noDateBool == true{
            noDateInfo.text = "keine Termine"
            noDateInfo.font = .systemFont(ofSize: 20, weight: .semibold)
            noDateInfo.isHidden = false
            dateTime.isHidden = true
            dateType.isHidden = true
        }
        else if noDateBool == false && i == 1 {
            dateTime.text = "10:00 - 16:00"
            dateType.text = "Chemotherapie"
            dateTime.font = .systemFont(ofSize: 19, weight: .semibold)
            dateType.font = .systemFont(ofSize: 19, weight: .semibold)
            noDateInfo.isHidden = true
            dateTime.isHidden = false
            dateType.isHidden = false
        } else if noDateBool == false && i == 2 {
            dateTime.text = "09:00 - 10:00"
            dateType.text = "Untersuchung"
            dateTime.font = .systemFont(ofSize: 19, weight: .semibold)
            dateType.font = .systemFont(ofSize: 19, weight: .semibold)
            noDateInfo.isHidden = true
            dateTime.isHidden = false
            dateType.isHidden = false
        }
    }
    
    @objc func getDateInfo(sender: UIButton) {
        
        for i in novCount {
            dayButtons[i].layer.borderColor = UIColor.white.cgColor
            dayButtons[i].layer.borderWidth = 0
        }
        
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 2
        
        if sender.backgroundColor == .blue.withAlphaComponent(0.2) {
            noDateBool = false
            setDateInfo(i: 1)
            dateInfoView.backgroundColor = .blue.withAlphaComponent(0.2)
        } else if sender.backgroundColor == .green.withAlphaComponent(0.15){
            noDateBool = false
            setDateInfo(i: 2)
            dateInfoView.backgroundColor = .green.withAlphaComponent(0.15)
        }else {
            noDateBool = true
            setDateInfo(i: 0)
            dateInfoView.backgroundColor = .white
        }
    }
     
    func setupNavigationBarItems() {
        navigationItem.title = "CALENDAR"
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(segueDiary(sender:)))
    }

}
