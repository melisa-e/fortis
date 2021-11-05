//
//  CalenderViewController.swift
//  fortis_app
//
//  Created by Melisa on 01.11.21.
//

import UIKit

class CalenderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
        setupNavigationBarItems()
    }
    
    func setupNavigationBarItems() {
        navigationItem.title = "calender"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(segueDiary(sender:)))
    }

}
