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
        dateLabel.text = "\(date). \(Calendar.current.shortMonthSymbols[month-1]) "
        
        if dayLabel.text == "Monday" {
            dayLabel.text = "Montag"
        }
        else if dayLabel.text == "Tuesday" {
            dayLabel.text = "Dienstag"
        }
        else if dayLabel.text == "Wednesday" {
            dayLabel.text = "Mittwoch"
        }
        else if dayLabel.text == "Thursday" {
            dayLabel.text = "Donnerstag"
        }
        else if dayLabel.text == "Friday" {
            dayLabel.text = "Freitag"
        }
        else if dayLabel.text == "Saturday" {
            dayLabel.text = "Samstag"
        }
        else if dayLabel.text == "Sunday" {
            dayLabel.text = "Sonntag"
        }
        
        calenderView.addSubview(dayLabel)
        calenderView.addSubview(dateLabel)
        
        dayLabel.font = .systemFont(ofSize: 35, weight: .semibold)
        dateLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.leadingAnchor.constraint(equalTo: calenderView.leadingAnchor, constant: 15).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: calenderView.centerYAnchor, constant: -10).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.leadingAnchor.constraint(equalTo: calenderView.leadingAnchor, constant: 15).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: calenderView.bottomAnchor).isActive = true
    }
    
    func setupCalenderView(){
        view.addSubview(calenderView)
        calenderView.anchor(height: view.heightAnchor, width: view.widthAnchor, heightMultiplier: 0.1, widthMultiplier: 1)
        calenderView.layer.cornerRadius = 15
        calenderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        calenderView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        calenderView.backgroundColor = .white
        //calenderView.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
    }
    
    func setupCategoryButtons(){
       
        //Food
        
        btnsFood = [foodBtnOne, foodBtnTwo, foodBtnThree, foodBtnFour, foodBtnFive]
        for i in btnsFood {
            i.setImage(UIImage(named: "food_icon"), for: .normal)
        }
        
        //Mood
        
        btnsMood = [moodBtnOne, moodBtnTwo, moodBtnThree, moodBtnFour, moodBtnFive]
        let moodImages: [UIImage] = [UIImage(named: "sad")!, UIImage(named: "annoyed")!, UIImage(named: "neutral")!, UIImage(named: "fine")!, UIImage(named: "happy")!]
        
        for i in 0...btnsMood.count-1{
            btnsMood[i].setImage(moodImages[i], for: .normal)
        }
        
        //sleep
        
        btnsSleep = [sleepBtnOne, sleepBtnTwo, sleepBtnThree, sleepBtnFour, sleepBtnFive]
        
        for i in 0...btnsMood.count-1{
            btnsSleep[i].setImage(moodImages[i], for: .normal)
        }
        
        //complains
        
        let compImages: [UIImage] = [UIImage(named: "headache")!, UIImage(named: "nausea")!, UIImage(named: "dizziness")!]
        
        btnsComplain = [complainBtnOne, complainBtnTwo, complainBtnThree, complainBtnFour, complainBtnFive]
        
        for i in 0...compImages.count-1{
            btnsComplain[i].setImage(compImages[i], for: .normal)
        }
        
        //activities
        
        let activityImages: [UIImage] = [UIImage(named: "painting")!, UIImage(named: "music")!, UIImage(named: "sport")!, UIImage(named: "cooking")!, UIImage(named: "reading")!]
        
        btnsActivity = [activityBtnOne, activityBtnTwo, activityBtnThree, activityBtnFour, activityBtnFive]
        
        for i in 0...btnsActivity.count-1{
            btnsActivity[i].setImage(activityImages[i], for: .normal)
        }
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.rowHeight = 150
        tableView.rowHeight = view.frame.size.height/5
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.anchor(top: calenderView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, topPadding: 10, leadingPadding: 0, bottomPadding: 0, trailingPadding: 0)
    }
    
    func setupNavigationBarItems() {
        navigationItem.title = "diary entry"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(unwindToHome(_:)))
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
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
            cell.setImage(title: categories[indexPath.row], btn: btnsFood, row: indexPath.row)
        }
        
        if indexPath.row == 1 {
            cell.setImage(title: categories[indexPath.row], btn: btnsMood, row: indexPath.row)
        }
        
        if indexPath.row == 2 {
            cell.setImage(title: categories[indexPath.row], btn: btnsSleep, row: indexPath.row)
        }
        
        if indexPath.row == 3 {
            cell.setImage(title: categories[indexPath.row], btn: btnsComplain, row: indexPath.row)
        }
        
        if indexPath.row == 4 {
            cell.setImage(title: categories[indexPath.row], btn: btnsActivity, row: indexPath.row)
        }
        
        //cell.set(title: categories[indexPath.row], btn: btnsMood, row: indexPath.row)
        
        return cell
    }
    
}
