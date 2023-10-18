//
//  MyTabViewController.swift
//  TabBarController
//
//  Created by 김건우 on 10/18/23.
//

import UIKit

// ⭐️ 일반적으로 하나의 앱에는 하나의 탭 바 컨트롤러만 포함되므로,
// UITabBarController 클래스를 상속하는 클래스를 만들어 하위 뷰 컨트롤러와 탭 바의 모습을 관리함.
class MyTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var attributesNormal = AttributeContainer()
        attributesNormal.foregroundColor = UIColor.systemGray
        
        var attributesSelected = AttributeContainer()
        attributesSelected.foregroundColor = UIColor.systemGreen
        
        let standard = UITabBarAppearance()
        standard.backgroundColor = UIColor.systemGray5
        // ⭐️ Portrait 모드에서 하단 탭 바가 크게 표시될 때의 모습을 정의
        standard.stackedLayoutAppearance.normal.iconColor = UIColor.systemGray
        // ⭐️ Landscape 모드에서 하단 탭 바가 작게 일렬로 표시될 때의 모습을 정의
        standard.compactInlineLayoutAppearance.normal.iconColor = UIColor.systemGray
        // ⭐️ 아이패드에서 하단 탭 바의 모습을 정의 (아이패드에서는 기본적으로 inline으로 탭 바를 보여줌)
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
        
        // ⭐️ 탭 바 아이템의 위치를 결정
        standard.stackedItemPositioning = .centered
        // ⭐️ 탭 바 아이템의 너비 값을 결정
        standard.stackedItemWidth = 50.0
        // ⭐️ 탭 바 아이템 사이의 간격을 결정
        standard.stackedItemSpacing = 0.0
        
        self.tabBar.backgroundColor = UIColor.systemBrown
        self.tabBar.standardAppearance = standard
        
        // 탭 바 컨트롤러의 첫 번째 뷰 컨트롤러의 탭 바 아이템의 배지에 "20"으로 설정
        let list = viewControllers!
        let controller = list[0] as! ViewController
        controller.tabBarItem.badgeValue = String(20)
        
        // 앱을 켜면 처음에 보이는 화면을 두 번째 탭으로 설정
        self.selectedIndex = 1
        
        delegate = self
    }

}

extension MyTabViewController: UITabBarControllerDelegate {
    
    // 탭 바 아이템을 선택한 후, 호출되는 델리게이트 메서드
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let list = viewControllers!
        let controller = list[1]
        if viewController === controller {
            print("It's Settings!")
        }
    }
    
}
