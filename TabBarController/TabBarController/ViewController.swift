//
//  ViewController.swift
//  TabBarController
//
//  Created by 김건우 on 10/18/23.
//

import UIKit

class ViewController: UIViewController {

    var counter: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateBadge(_ sender: UIButton) {
        if let item = self.tabBarItem {
            item.title = "New Weather"
            item.badgeValue = String(counter)
            counter += 1
        }
    }
    

}

