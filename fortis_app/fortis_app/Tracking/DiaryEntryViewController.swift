//
//  DiaryEntryViewController.swift
//  fortis_app
//
//  Created by Melisa on 01.11.21.
//

import UIKit

class DiaryEntryViewController: UIViewController {
    
    let foodBtnOne = UIButton()
    let foodBtnTwo = UIButton()
    let foodBtnThree = UIButton()
    let foodBtnFour = UIButton()
    let foodBtnFive = UIButton()
    var btnsFood = [UIButton()]
    
    let moodBtnOne = UIButton()
    let moodBtnTwo = UIButton()
    let moodBtnThree = UIButton()
    let moodBtnFour = UIButton()
    let moodBtnFive = UIButton()
    var btnsMood = [UIButton()]
    
    let sleepBtnOne = UIButton()
    let sleepBtnTwo = UIButton()
    let sleepBtnThree = UIButton()
    let sleepBtnFour = UIButton()
    let sleepBtnFive = UIButton()
    var btnsSleep = [UIButton()]
    
    let complainBtnOne = UIButton()
    let complainBtnTwo = UIButton()
    let complainBtnThree = UIButton()
    let complainBtnFour = UIButton()
    let complainBtnFive = UIButton()
    var btnsComplain = [UIButton()]
    
    let activityBtnOne = UIButton()
    let activityBtnTwo = UIButton()
    let activityBtnThree = UIButton()
    let activityBtnFour = UIButton()
    let activityBtnFive = UIButton()
    var btnsActivity = [UIButton()]
    
    let categories = ["Essen", "Laune", "Schlaf", "Beschwerden", "Aktivitäten"]
    
    let cellId = "CategoryTableViewCell"
    
    var tableView = UITableView()
    let calenderView = UIView()
    
    let dayLabel = UILabel()
    let dateLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "diary entry"
        
        
        
        setupCalenderView()
        setupDateLabel()
        setupCategoryButtons()
        setupNavigationBarItems()
        configureTableView()
    }
    
    func setupDateLabel(){
        
        let today = Date()
        let weekday = Calendar.current.component(.weekday, from: today)
        let month = Calendar.current.component(.month, from: today)
        let date = Calendar.current.component(.day, from: today)
        
        dayLabel.text = Calendar.current.weekdaySymbols[weekday-1]
        dateLabel.text = "\(Calendar.current.shortMonthSymbols[month-1]) \(date)"
        
        calenderView.addSubview(dayLabel)
        calenderView.addSubview(dateLabel)
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.centerXAnchor.constraint(equalTo: calenderView.centerXAnchor).isActive = true
        dayLabel.bottomAnchor.constraint(equalTo: calenderView.centerYAnchor).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerXAnchor.constraint(equalTo: calenderView.centerXAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: calenderView.centerYAnchor).isActive = true
    
    }
    
    func setupCalenderView(){
        view.addSubview(calenderView)
        calenderView.anchor(height: view.heightAnchor, width: view.widthAnchor, heightMultiplier: 0.1, widthMultiplier: 0.95)
        calenderView.layer.cornerRadius = 15
        calenderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        calenderView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        calenderView.backgroundColor = .red.withAlphaComponent(0.5)
    }
    
    func setupCategoryButtons(){
       
        //Food
        
        foodBtnOne.setTitle("Food 1", for: .normal)
        foodBtnTwo.setTitle("Food 2", for: .normal)
        foodBtnThree.setTitle("Food 3", for: .normal)
        foodBtnFour.setTitle("Food 4", for: .normal)
        foodBtnFive.setTitle("Food 5", for: .normal)
        btnsFood = [foodBtnOne, foodBtnTwo, foodBtnThree, foodBtnFour, foodBtnFive]
        
        //Mood
        
        moodBtnOne.setTitle("Mood 1", for: .normal)
        moodBtnTwo.setTitle("Mood 2", for: .normal)
        moodBtnThree.setTitle("Mood 3", for: .normal)
        moodBtnFour.setTitle("Mood 4", for: .normal)
        moodBtnFive.setTitle("Mood 5", for: .normal)
        btnsMood = [moodBtnOne, moodBtnTwo, moodBtnThree, moodBtnFour, moodBtnFive]
        
        //sleep
        
        sleepBtnOne.setTitle("Sleep 1", for: .normal)
        sleepBtnTwo.setTitle("Sleep 2", for: .normal)
        sleepBtnThree.setTitle("Sleep 3", for: .normal)
        sleepBtnFour.setTitle("Sleep 4", for: .normal)
        sleepBtnFive.setTitle("Sleep 5", for: .normal)
        btnsSleep = [sleepBtnOne, sleepBtnTwo, sleepBtnThree, sleepBtnFour, sleepBtnFive]
        
        //complains
        
        complainBtnOne.setTitle("Comp 1", for: .normal)
        complainBtnTwo.setTitle("Comp 2", for: .normal)
        complainBtnThree.setTitle("Comp 3", for: .normal)
        complainBtnFour.setTitle("Comp 4", for: .normal)
        complainBtnFive.setTitle("Comp 5", for: .normal)
        btnsComplain = [complainBtnOne, complainBtnTwo, complainBtnThree, complainBtnFour, complainBtnFive]
        
        //activities
        
        activityBtnOne.setTitle("Act 1", for: .normal)
        activityBtnTwo.setTitle("Act 2", for: .normal)
        activityBtnThree.setTitle("Act 3", for: .normal)
        activityBtnFour.setTitle("Act 4", for: .normal)
        activityBtnFive.setTitle("Act 5", for: .normal)
        btnsActivity = [activityBtnOne, activityBtnTwo, activityBtnThree, activityBtnFour, activityBtnFive]
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.rowHeight = 150
        tableView.rowHeight = view.frame.size.height/5
        //tableView.backgroundColor = .blue
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: cellId)
        //tableView.anchor(top: calenderView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
        tableView.anchor(top: calenderView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, topPadding: 10, leadingPadding: 0, bottomPadding: 0, trailingPadding: 0)
    }
    
    func setupNavigationBarItems() {
        navigationItem.title = "diary entry"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(unwindToHome(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
    }
    
    @IBAction func unwindToHome(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }

}

extension DiaryEntryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! CategoryTableViewCell
        
        
        if indexPath.row == 0 {
            cell.set(title: categories[indexPath.row], btn: btnsFood, row: indexPath.row)
        }
        
        if indexPath.row == 1 {
            cell.set(title: categories[indexPath.row], btn: btnsMood, row: indexPath.row)
        }
        
        if indexPath.row == 2 {
            cell.set(title: categories[indexPath.row], btn: btnsSleep, row: indexPath.row)
        }
        
        if indexPath.row == 3 {
            cell.set(title: categories[indexPath.row], btn: btnsComplain, row: indexPath.row)
        }
        
        if indexPath.row == 4 {
            cell.set(title: categories[indexPath.row], btn: btnsActivity, row: indexPath.row)
        }
        
        //cell.set(title: categories[indexPath.row], btn: btnsMood, row: indexPath.row)
        
        return cell
    }
    
}

