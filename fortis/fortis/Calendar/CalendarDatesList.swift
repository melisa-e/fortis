//
//  CalendarDatesList.swift
//  fortis_app
//
//  Created by Melisa on 08.11.21.
//

import UIKit

extension CalendarViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if indexPath.row == 0 {
            
            let check = UIImageView()
            cell.addSubview(check)
            check.image = UIImage(named: "check_green")
            check.anchor(height: cell.widthAnchor, width: cell.widthAnchor, heightMultiplier: 0.09, widthMultiplier: 0.09)
            check.centerXAnchor.constraint(equalTo: cell.leadingAnchor, constant: 30).isActive = true
            check.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            
            let date = UILabel()
            date.text = "14. Dec"
            date.font = .systemFont(ofSize: 22, weight: .semibold)
            
            cell.addSubview(date)
            date.translatesAutoresizingMaskIntoConstraints = false
            date.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            date.trailingAnchor.constraint(equalTo: cell.centerXAnchor, constant: -50).isActive = true
            
            let time = UILabel()
            time.text = "09:00 - 10:00"
            time.font = .systemFont(ofSize: 18)
            
            cell.addSubview(time)
            time.translatesAutoresizingMaskIntoConstraints = false
            time.bottomAnchor.constraint(equalTo: cell.centerYAnchor, constant: -3).isActive = true
            time.leadingAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            
            let type = UILabel()
            type.text = "Untersuchung"
            type.font = .systemFont(ofSize: 18)
            
            cell.addSubview(type)
            type.translatesAutoresizingMaskIntoConstraints = false
            type.topAnchor.constraint(equalTo: cell.centerYAnchor, constant: 3).isActive = true
            type.leadingAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            
        } else if indexPath.row == 1 {
            
            let check = UIImageView()
            cell.addSubview(check)
            check.image = UIImage(named: "check_grey")
            check.anchor(height: cell.widthAnchor, width: cell.widthAnchor, heightMultiplier: 0.09, widthMultiplier: 0.09)
            check.centerXAnchor.constraint(equalTo: cell.leadingAnchor, constant: 30).isActive = true
            check.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            
            let date = UILabel()
            date.text = "24. Dec"
            date.font = .systemFont(ofSize: 22, weight: .semibold)
            
            cell.addSubview(date)
            date.translatesAutoresizingMaskIntoConstraints = false
            date.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            date.trailingAnchor.constraint(equalTo: cell.centerXAnchor, constant: -50).isActive = true
            
            let time = UILabel()
            time.text = "10:00 - 16:00"
            time.font = .systemFont(ofSize: 18)
            
            cell.addSubview(time)
            time.translatesAutoresizingMaskIntoConstraints = false
            time.bottomAnchor.constraint(equalTo: cell.centerYAnchor, constant: -3).isActive = true
            time.leadingAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            
            let type = UILabel()
            type.text = "Chemotherapie"
            type.font = .systemFont(ofSize: 18)
            
            cell.addSubview(type)
            type.translatesAutoresizingMaskIntoConstraints = false
            type.topAnchor.constraint(equalTo: cell.centerYAnchor, constant: 3).isActive = true
            type.leadingAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        }
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        cell.selectionStyle = .none
        
        return cell
    }
    
}
