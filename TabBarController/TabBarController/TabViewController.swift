//
//  TabViewController.swift
//  TabBarController
//
//  Created by 김건우 on 12/11/23.
//

import UIKit

final class TabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var attributesNormal = AttributeContainer()
        attributesNormal.foregroundColor = UIColor.systemGray
        
        var attributesSelected = AttributeContainer()
        attributesSelected.foregroundColor = UIColor.systemGreen
        
        let standard = UITabBarAppearance()
        standard.backgroundColor = UIColor.systemGray5
        standard.stackedLayoutAppearance.normal.iconColor = UIColor.systemGray
        standard.compactInlineLayoutAppearance.normal.iconColor = UIColor.systemGray
        standard.inlineLayoutAppearance.normal.iconColor = UIColor.systemGray
        if let attr = try? Dictionary(attributesNormal, including: \.uiKit) {
            standard.stackedLayoutAppearance.normal.titleTextAttributes = attr
            standard.compactInlineLayoutAppearance.normal.titleTextAttributes = attr
            standard.inlineLayoutAppearance.normal.titleTextAttributes = attr
        }
        
        standard.stackedLayoutAppearance.selected.iconColor = UIColor.systemGreen
        standard.compactInlineLayoutAppearance.selected.iconColor = UIColor.systemGreen
        standard.inlineLayoutAppearance.selected.iconColor = UIColor.systemGreen
        if let attr = try? Dictionary(attributesSelected, including: \.uiKit) {
            standard.stackedLayoutAppearance.selected.titleTextAttributes = attr
            standard.compactInlineLayoutAppearance.selected.titleTextAttributes = attr
            standard.inlineLayoutAppearance.selected.titleTextAttributes = attr
        }
        
        standard.stackedItemPositioning = .centered
        standard.stackedItemWidth = 20.0
        standard.stackedItemSpacing = 300.0
        
        tabBar.standardAppearance = standard
        
        delegate = self
        selectedIndex = 1
    }
}

extension TabViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let list = viewControllers!
        let controller = list[0]
        if viewController === controller {
            print("Is's Settings!")
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let controller = viewController as? WeatherViewController {
            let control = controller.counter
            
            if control == 0 {
                return false
            }
        }
        return true
    }
}
