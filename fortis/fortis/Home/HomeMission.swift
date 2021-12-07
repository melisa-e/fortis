//
//  HomeMission.swift
//  fortis_app
//
//  Created by Melisa on 09.11.21.
//

import UIKit

extension HomeViewController {
    
    func setupMissions() {
        
        let missionsLabel = UILabel()
        let dailyTrackingLabel = UILabel()
        let appointmentTrackingLabel = UILabel()
        
        let checkTracking = UIButton()
        let checkAppointment = UIButton()
        
        let trackingPoints = UILabel()
        let appointmentPoints = UILabel()
        
        missionView.addSubview(missionsLabel)
        missionsLabel.text = "Missionen"
        missionsLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        missionsLabel.translatesAutoresizingMaskIntoConstraints = false
        missionsLabel.centerXAnchor.constraint(equalTo: missionView.centerXAnchor).isActive = true
        missionsLabel.topAnchor.constraint(equalTo: missionView.topAnchor, constant: 30).isActive = true
        
        missionView.addSubview(checkTracking)
        checkTracking.setImage(UIImage(named: "check_grey"), for: .normal)
        checkTracking.anchor(height: missionView.widthAnchor, width: missionView.widthAnchor, heightMultiplier: 0.11, widthMultiplier: 0.11)
        checkTracking.leadingAnchor.constraint(equalTo: missionView.leadingAnchor, constant: 30).isActive = true
        checkTracking.centerYAnchor.constraint(equalTo: missionView.centerYAnchor, constant: -5).isActive = true
        
        missionView.addSubview(dailyTrackingLabel)
        dailyTrackingLabel.text = "Tagebucheintrag"
        dailyTrackingLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        dailyTrackingLabel.translatesAutoresizingMaskIntoConstraints = false
        dailyTrackingLabel.leadingAnchor.constraint(equalTo: checkTracking.trailingAnchor, constant: 20).isActive = true
        dailyTrackingLabel.centerYAnchor.constraint(equalTo: checkTracking.centerYAnchor).isActive = true
        
        missionView.addSubview(trackingPoints)
        trackingPoints.text = "+ 1"
        trackingPoints.font = .systemFont(ofSize: 18, weight: .semibold)
        trackingPoints.translatesAutoresizingMaskIntoConstraints = false
        trackingPoints.leadingAnchor.constraint(equalTo: missionView.trailingAnchor, constant: -80).isActive = true
        trackingPoints.centerYAnchor.constraint(equalTo: dailyTrackingLabel.centerYAnchor).isActive = true
        
        missionView.addSubview(checkAppointment)
        checkAppointment.setImage(UIImage(named: "check_grey"), for: .normal)
        checkAppointment.anchor(height: missionView.widthAnchor, width: missionView.widthAnchor, heightMultiplier: 0.11, widthMultiplier: 0.11)
        checkAppointment.leadingAnchor.constraint(equalTo: missionView.leadingAnchor, constant: 30).isActive = true
        checkAppointment.topAnchor.constraint(equalTo: dailyTrackingLabel.bottomAnchor, constant: 30).isActive = true
        
        missionView.addSubview(appointmentTrackingLabel)
        appointmentTrackingLabel.text = "Termin"
        appointmentTrackingLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        appointmentTrackingLabel.translatesAutoresizingMaskIntoConstraints = false
        appointmentTrackingLabel.leadingAnchor.constraint(equalTo: checkAppointment.trailingAnchor, constant: 20).isActive = true
        appointmentTrackingLabel.centerYAnchor.constraint(equalTo: checkAppointment.centerYAnchor).isActive = true
        
        missionView.addSubview(appointmentPoints)
        appointmentPoints.text = "+ 2"
        appointmentPoints.font = .systemFont(ofSize: 18, weight: .semibold)
        appointmentPoints.translatesAutoresizingMaskIntoConstraints = false
        appointmentPoints.leadingAnchor.constraint(equalTo: missionView.trailingAnchor, constant: -80).isActive = true
        appointmentPoints.centerYAnchor.constraint(equalTo: appointmentTrackingLabel.centerYAnchor).isActive = true
    }
    
}
