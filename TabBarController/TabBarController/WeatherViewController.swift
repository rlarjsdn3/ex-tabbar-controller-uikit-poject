//
//  WeahtherViewController.swift
//  TabBarController
//
//  Created by 김건우 on 10/18/23.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    var counter: Int = 1

    @IBAction func updateBadge(_ sender: Any) {
        if let item = self.tabBarItem {
            item.title = "New Weather"
            item.badgeValue = String(counter)
            counter += 1
        }
    }
    
}
