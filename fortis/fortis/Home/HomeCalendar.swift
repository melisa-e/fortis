//
//  HomeCalendar.swift
//  fortis_app
//
//  Created by Melisa on 09.11.21.
//

import UIKit

extension HomeViewController {
    
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
