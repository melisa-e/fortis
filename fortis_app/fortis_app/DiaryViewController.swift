//
//  DiaryViewController.swift
//  fortis_app
//
//  Created by Melisa on 01.11.21.
//

import UIKit

class DiaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.green
        setupNavigationBarItems()

    }
    
    func setupNavigationBarItems() {
        navigationItem.title = "diary"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
    }

}
