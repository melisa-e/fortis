//
//  ReviewViewController.swift
//  fortis
//
//  Created by Melisa on 12.11.21.
//

import UIKit

class ReviewViewController: UIViewController {
    
    let calendarView = UIView()
    let barChartView = UIView()
    let feedbackView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubViews()
        setupCalendarView()
        setupFeedback()
        setupBarChart()
    }
    
    func setupBarChart(){
        
        let activityLabel = UILabel()
        barChartView.addSubview(activityLabel)
        activityLabel.text = "Aktivitäten"
        activityLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        
        activityLabel.translatesAutoresizingMaskIntoConstraints = false
        activityLabel.centerXAnchor.constraint(equalTo: barChartView.centerXAnchor).isActive = true
        activityLabel.topAnchor.constraint(equalTo: barChartView.topAnchor, constant: 10).isActive = true
        
        let verticalLine = UIView()
        barChartView.addSubview(verticalLine)
        verticalLine.backgroundColor = .black
        verticalLine.translatesAutoresizingMaskIntoConstraints = false
        verticalLine.centerYAnchor.constraint(equalTo: barChartView.centerYAnchor).isActive = true
        //verticalLine.leadingAnchor.constraint(equalTo: barChartView.leadingAnchor, constant: 56).isActive = true
        verticalLine.widthAnchor.constraint(equalToConstant: 4).isActive = true
        verticalLine.heightAnchor.constraint(equalTo: barChartView.heightAnchor, multiplier: 0.7).isActive = true
        verticalLine.layer.cornerRadius = 2
        
        let horizontalLine = UIView()
        barChartView.addSubview(horizontalLine)
        horizontalLine.backgroundColor = .black
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false
        horizontalLine.centerYAnchor.constraint(equalTo: verticalLine.bottomAnchor).isActive = true
        horizontalLine.centerXAnchor.constraint(equalTo: barChartView.centerXAnchor, constant: 10).isActive = true
        horizontalLine.heightAnchor.constraint(equalToConstant: 4).isActive = true
        horizontalLine.widthAnchor.constraint(equalTo: barChartView.widthAnchor, multiplier: 0.75).isActive = true
        horizontalLine.layer.cornerRadius = 2
        
        verticalLine.trailingAnchor.constraint(equalTo: horizontalLine.leadingAnchor, constant: 4).isActive = true
        
        let numberStack = UIStackView()
        barChartView.addSubview(numberStack)
        numberStack.anchor(height: verticalLine.heightAnchor, width: verticalLine.widthAnchor, heightMultiplier: 1, widthMultiplier: 3)
        numberStack.centerYAnchor.constraint(equalTo: barChartView.centerYAnchor, constant: -20).isActive = true
        numberStack.trailingAnchor.constraint(equalTo: verticalLine.leadingAnchor, constant: -20).isActive = true
        numberStack.setStackProperties(stack: numberStack, alignment: "fill", distribution: "fe")
        numberStack.spacing = 5
        numberStack.axis = .vertical
        
        for i in (1...6).reversed() {
            
            let tmp = UILabel()
            tmp.font = .systemFont(ofSize: 18, weight: .semibold)
            tmp.textAlignment = .center
            if i == 6{
                numberStack.addArrangedSubview(tmp)
                tmp.backgroundColor = .white
            }
            else {
                
                tmp.text = String(i)
                numberStack.addArrangedSubview(tmp)
            }
        }
        
        let helpLines = UIStackView()
        barChartView.addSubview(helpLines)
        helpLines.anchor(height: verticalLine.heightAnchor, width: horizontalLine.widthAnchor, heightMultiplier: 1, widthMultiplier: 1)
        helpLines.centerYAnchor.constraint(equalTo: barChartView.centerYAnchor, constant: -20).isActive = true
        helpLines.centerXAnchor.constraint(equalTo: barChartView.centerXAnchor, constant: 10).isActive = true
        helpLines.setStackProperties(stack: helpLines, alignment: "fill", distribution: "fe")
        helpLines.spacing = 5
        helpLines.axis = .vertical
        
        for i in (1...6).reversed() {
            
            let tmp = UIView()
            helpLines.addArrangedSubview(tmp)
            let helpLine = UIView()
            
            tmp.addSubview(helpLine)
            
            if i != 6 {
                helpLine.backgroundColor = .black.withAlphaComponent(0.1)
            }
            
            helpLine.translatesAutoresizingMaskIntoConstraints = false
            helpLine.widthAnchor.constraint(equalTo: tmp.widthAnchor).isActive = true
            helpLine.heightAnchor.constraint(equalToConstant: 4).isActive = true
            helpLine.center(centerX: tmp.centerXAnchor, centerY: tmp.centerYAnchor)
            helpLine.layer.cornerRadius = 2
            
        }
        
        let weekStack = UIStackView()
        barChartView.addSubview(weekStack)
        weekStack.anchor(height: horizontalLine.heightAnchor, width: horizontalLine.widthAnchor, heightMultiplier: 4, widthMultiplier: 1)
        weekStack.centerYAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 20).isActive = true
        weekStack.centerXAnchor.constraint(equalTo: horizontalLine.centerXAnchor, constant: 20).isActive = true
        weekStack.setStackProperties(stack: weekStack, alignment: "fill", distribution: "fe")
        weekStack.spacing = 5
        weekStack.axis = .horizontal
        
        let weekLabels: [String] = ["m", "d", "m", "d", "f", "s", "s"]
        
        for i in (0...weekLabels.count) {
            
            let tmp = UILabel()
            tmp.font = .systemFont(ofSize: 18, weight: .semibold)
            tmp.textAlignment = .center
            if i == 7 {
                weekStack.addArrangedSubview(tmp)
                tmp.backgroundColor = .white
            }
            else {
                
                tmp.text = weekLabels[i]
                weekStack.addArrangedSubview(tmp)
            }
        }
        
        let barStack = UIStackView()
        barChartView.addSubview(barStack)
        barStack.translatesAutoresizingMaskIntoConstraints = false
        barStack.centerYAnchor.constraint(equalTo: barChartView.centerYAnchor).isActive = true
        barStack.centerXAnchor.constraint(equalTo: horizontalLine.centerXAnchor, constant: 20).isActive = true
        barStack.widthAnchor.constraint(equalTo: horizontalLine.widthAnchor).isActive = true
        barStack.heightAnchor.constraint(equalTo: barChartView.heightAnchor, multiplier: 0.7).isActive = true
        barStack.setStackProperties(stack: barStack, alignment: "fill", distribution: "fe")
        barStack.spacing = 5
        barStack.axis = .horizontal
        
        for i in (0...7) {
            
            let tmp = UIView()
            barStack.addArrangedSubview(tmp)
            
            let bar = UIView()
            tmp.addSubview(bar)
            bar.backgroundColor = .white
            
            if i == 0 {
                bar.backgroundColor = .black
                bar.heightAnchor.constraint(equalTo: tmp.heightAnchor, multiplier: 0.33).isActive = true
            }
            else if i == 1{
                bar.backgroundColor = .black
                bar.heightAnchor.constraint(equalTo: tmp.heightAnchor, multiplier: 0.67).isActive = true
            }
            else if i == 2{
                bar.backgroundColor = .black
                bar.heightAnchor.constraint(equalTo: tmp.heightAnchor, multiplier: 0.5).isActive = true
            }
            else if i == 3{
                bar.backgroundColor = .black
                bar.heightAnchor.constraint(equalTo: tmp.heightAnchor, multiplier: 0.33).isActive = true
            }
            
            bar.translatesAutoresizingMaskIntoConstraints = false
            bar.widthAnchor.constraint(equalToConstant: 8).isActive = true
            bar.centerXAnchor.constraint(equalTo: tmp.centerXAnchor).isActive = true
            bar.bottomAnchor.constraint(equalTo: tmp.bottomAnchor).isActive = true
            bar.layer.cornerRadius = 4
        }
        
    }
    
    func setupSubViews(){
        view.addSubview(calendarView)
        
        calendarView.backgroundColor = .white
        calendarView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.15, widthMultiplier: 0.95)
        calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        calendarView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        calendarView.layer.cornerRadius = 10
        calendarView.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        
        view.addSubview(barChartView)
        barChartView.backgroundColor = .white
        barChartView.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        barChartView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.5, widthMultiplier: 0.95)
        barChartView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        barChartView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 10).isActive = true
        barChartView.layer.cornerRadius = 10
        
        view.addSubview(feedbackView)
        feedbackView.backgroundColor = .white
        feedbackView.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        feedbackView.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.3, widthMultiplier: 0.95)
        feedbackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        feedbackView.topAnchor.constraint(equalTo: barChartView.bottomAnchor, constant: 10).isActive = true
        feedbackView.layer.cornerRadius = 10
    }
    
    func setupFeedback() {
        
        let feedbackLabel = UILabel()
        let feedbackDetail = UILabel()
        let tipLabel = UILabel()
        
        feedbackView.addSubview(feedbackLabel)
        feedbackLabel.text = "Feeback"
        feedbackLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        feedbackLabel.translatesAutoresizingMaskIntoConstraints = false
        feedbackLabel.centerXAnchor.constraint(equalTo: feedbackView.centerXAnchor).isActive = true
        feedbackLabel.topAnchor.constraint(equalTo: feedbackView.topAnchor, constant: 20).isActive = true
        
        feedbackView.addSubview(feedbackDetail)
        feedbackDetail.numberOfLines = 0
        feedbackDetail.textAlignment = .center
        feedbackDetail.text = "Du hast warst diese Woche besonders aktiv, weiter so!"
        feedbackDetail.font = .systemFont(ofSize: 18, weight: .semibold)
        feedbackDetail.translatesAutoresizingMaskIntoConstraints = false
        feedbackDetail.leadingAnchor.constraint(equalTo: feedbackView.leadingAnchor, constant: 30).isActive = true
        feedbackDetail.trailingAnchor.constraint(equalTo: feedbackView.trailingAnchor, constant: -30).isActive = true
        feedbackDetail.centerYAnchor.constraint(equalTo: feedbackView.centerYAnchor, constant: -25).isActive = true
        
        feedbackView.addSubview(tipLabel)
        tipLabel.numberOfLines = 0
        tipLabel.textAlignment = .center
        tipLabel.text = "Tipp: Die Weihnachtszeit rückt näher, wie wäre es mit Plätzchen backen?"
        tipLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        tipLabel.leadingAnchor.constraint(equalTo: feedbackView.leadingAnchor, constant: 30).isActive = true
        tipLabel.trailingAnchor.constraint(equalTo: feedbackView.trailingAnchor, constant: -30).isActive = true
        tipLabel.topAnchor.constraint(equalTo: feedbackDetail.bottomAnchor, constant: 15).isActive = true
        
        
    }
    
    func setupCalendarView () {
        
        let calendarStack = UIStackView()
        let monthView = UIView()
        let monthLabel = UILabel()
        let weekView = UIStackView()
        let month = Calendar.current.component(.month, from: Date())
        let t = Calendar.current.component(.day, from: Date.today().previous(.monday))
        let weekLabels: [Int] = [t, (t+1), (t+2), (t+3), (t+4), (t+5), (t+6)]
        
        calendarView.addSubview(calendarStack)
        calendarStack.anchor(height: calendarView.heightAnchor, width: calendarView.widthAnchor, heightMultiplier: 0.90, widthMultiplier: 0.95)
        calendarStack.center(centerX: calendarView.centerXAnchor, centerY: calendarView.centerYAnchor)
        calendarStack.layer.cornerRadius = 10
        calendarStack.setStackProperties(stack: calendarStack, alignment: "fill", distribution: "fillEqually")
        calendarStack.spacing = 5
        calendarStack.axis = .vertical
        
        calendarStack.addArrangedSubview(monthView)
        monthView.addSubview(monthLabel)
        monthLabel.center(centerX: monthView.centerXAnchor, centerY: monthView.centerYAnchor)
        monthView.layer.cornerRadius = 10
        monthLabel.text = Calendar.current.monthSymbols[month-1]
        monthLabel.font = .systemFont(ofSize: 21, weight: .bold)
    
        calendarStack.addArrangedSubview(weekView)
        weekView.setStackProperties(stack: weekView, alignment: "t", distribution: "es")
        
        for i in weekLabels {
            let tmp = UIButton()
            tmp.setTitle(String(i), for: .normal)
            weekView.addArrangedSubview(tmp)
            tmp.translatesAutoresizingMaskIntoConstraints = false
            tmp.heightAnchor.constraint(equalToConstant: 44).isActive = true
            tmp.widthAnchor.constraint(equalToConstant: 44).isActive = true
            tmp.backgroundColor = .black.withAlphaComponent(0.05)
            tmp.layer.cornerRadius = 22
            tmp.setTitleColor(.black, for: .normal)
            tmp.isEnabled = false
            
            if i == Calendar.current.component(.day, from: Date.today()) {
                tmp.backgroundColor = .orange.withAlphaComponent(0.2)
                tmp.layer.borderColor = UIColor.black.cgColor
                tmp.layer.borderWidth = 2
            }
            if i == 16 {
                tmp.backgroundColor = .green.withAlphaComponent(0.15)
            }
        }
    }

}
