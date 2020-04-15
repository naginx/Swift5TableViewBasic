//
//  NextViewController.swift
//  Swift5TableViewBasic
//
//  Created by nagisa miura on 2020/04/15.
//  Copyright © 2020 nagisa miura. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    var todoString = String()
    @IBOutlet weak var todoLabel: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        todoLabel.text = todoString
    }
    
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}
