//
//  CalenderMonthStack.swift
//  fortis_app
//
//  Created by Melisa on 08.11.21.
//

import UIKit

extension CalendarViewController {
    
    //*********************** SETUP BACKGROUND ***********************
    
    func setupStackView() {
        
        view.addSubview(calendarBackground)
        calendarBackground.backgroundColor = .white
        calendarBackground.anchor(height: view.safeAreaLayoutGuide.heightAnchor, width: view.safeAreaLayoutGuide.widthAnchor, heightMultiplier: 0.5, widthMultiplier: 0.95)
        calendarBackground.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        calendarBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        calendarBackground.layer.cornerRadius = 10
        calendarBackground.setShadow(color: .black, opacity: 0.2, offsetWidth: 2, offsetHeight: 2, radius: 4)
        
        calendarBackground.addSubview(calendarStack)
        calendarStack.anchor(height: calendarBackground.heightAnchor, width: calendarBackground.widthAnchor, heightMultiplier: 0.95, widthMultiplier: 0.95)
        calendarStack.center(centerX: calendarBackground.centerXAnchor, centerY: calendarBackground.centerYAnchor)
        calendarStack.layer.cornerRadius = 10
        calendarStack.setStackProperties(stack: calendarStack, alignment: "f", distribution: "fe")
        calendarStack.spacing = 5
        calendarStack.axis = .vertical
    }
    
    //*********************** SETUP MONTH LABEL ***********************
    
    func setupMonthLabel() {
        
        monthLabel.text = Calendar.current.monthSymbols[month-1]
        monthView.addSubview(monthLabel)
        monthLabel.font = .systemFont(ofSize: 21, weight: .bold)
        
        monthLabel.center(centerX: monthView.centerXAnchor, centerY: monthView.centerYAnchor)
    }
    
    //*********************** SETUP WEEKS ***********************
    
    func setupWeek() {
        
        calendarStack.addArrangedSubview(monthView)
        //monthView.backgroundColor = .orange
        monthView.layer.cornerRadius = 10
        
        let tmp = [weekLabel, weekOne, weekTwo, weekThree, weekFour, weekFive]
        
        for i in tmp {
            calendarStack.addArrangedSubview(i)
            i.setStackProperties(stack: i, alignment: "c", distribution: "es")
            //i.alignment = .center
            //i.distribution = .equalSpacing
        }
    }
    
    //*********************** SETUP DAY BUTTONS ***********************
    
    func setupDays() {
        
        let weekLabels: [String] = ["m", "d", "m", "d", "f", "s", "s"]
        
        for i in weekLabels {
            let tmp = UIButton()
            tmp.setTitle(i, for: .normal)
            weekLabel.addArrangedSubview(tmp)
            tmp.translatesAutoresizingMaskIntoConstraints = false
            tmp.heightAnchor.constraint(equalToConstant: 44).isActive = true
            tmp.widthAnchor.constraint(equalToConstant: 44).isActive = true
            tmp.backgroundColor = .black.withAlphaComponent(0.2)
            tmp.layer.cornerRadius = 22
            tmp.setTitleColor(.black, for: .normal)
        }
        
        for i in novCount {
            
            let tmp = UIButton()
            dayButtons.append(tmp)
            
            dayButtons[i].translatesAutoresizingMaskIntoConstraints = false
            dayButtons[i].heightAnchor.constraint(equalToConstant: 44).isActive = true
            dayButtons[i].widthAnchor.constraint(equalToConstant: 44).isActive = true
            
            if i >= 3 {
                dayButtons[i].backgroundColor = .black.withAlphaComponent(0.05)
                dayButtons[i].layer.cornerRadius = 22
                dayButtons[i].setTitleColor(.black, for: .normal)
            }
            
            if (i >= 1 && i <= 7){
                dayButtons[i].setTitle(String(novCount[i]), for: .normal)
                if i < 3 {
                    dayButtons[i].setTitleColor(.clear, for: .normal)
                    dayButtons[i].backgroundColor = .white
                    dayButtons[i].isEnabled = false
                }
                else {
                    dayButtons[i].setTitle(String(novCount[i-2]), for: .normal)
                }
                weekOne.addArrangedSubview(dayButtons[i])
            } else if (i >= 8 && i <= 14) {
                dayButtons[i].setTitle(String(novCount[i-2]), for: .normal)
                weekTwo.addArrangedSubview(dayButtons[i])
            }
            else if (i >= 15 && i <= 21) {
                dayButtons[i].setTitle(String(novCount[i-2]), for: .normal)
                weekThree.addArrangedSubview(dayButtons[i])
                
                if i == 16 {
                    dayButtons[i].backgroundColor = .green.withAlphaComponent(0.15)
                }
            }
            else if (i >= 22 && i <= 28) {
                dayButtons[i].setTitle(String(novCount[i-2]), for: .normal)
                weekFour.addArrangedSubview(dayButtons[i])
                
                if i == 26 {
                    dayButtons[i].backgroundColor = .blue.withAlphaComponent(0.2)
                }
            }
            else if (i >= 28 && i <= 35) {
                dayButtons[i].setTitle(String(novCount[i-2]), for: .normal)
                if i > 33 {
                    dayButtons[i].setTitleColor(.clear, for: .normal)
                    dayButtons[i].backgroundColor = .white
                    dayButtons[i].isEnabled = false
                }
                weekFive.addArrangedSubview(dayButtons[i])
            }
            
            if i == Int(date) {
                dayButtons[i].backgroundColor = .orange.withAlphaComponent(0.1)
                dayButtons[i].layer.borderColor = UIColor.black.cgColor
                dayButtons[i].layer.borderWidth = 2
            }
            
            dayButtons[i].addTarget(self, action: #selector(getDateInfo(sender:)), for: .touchUpInside)
        }
        
    }
}
