//
//  LevelViewController.swift
//  fortis_app
//
//  Created by Melisa on 01.11.21.
//

import UIKit

class LevelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        setupNavigationBarItems()
    }
    
    func setupNavigationBarItems() {
        navigationItem.title = "level"
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(segueDiary(sender:)))
    }

}
