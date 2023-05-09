//
//  HomeTabBarViewController.swift
//  PomodoroTimer
//
//  Created by Балауса Косжанова on 08.05.2023.
//
import UIKit

class HomeTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    let vc1 = UINavigationController(rootViewController: HomeViewController())
    let vc2 = UINavigationController(rootViewController: SettingsViewController())
    let vc3 = UINavigationController(rootViewController: HistoryViewController())
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
     }


    override func viewDidLoad() {
        tabBar.backgroundColor = .clear
        
        super.viewDidLoad()
        tabBarController?.delegate = self
        self.tabBar.tintColor = .white
        
        setViewControllers([vc1,vc2,vc3], animated: true)
        vc1.tabBarItem.image = UIImage(systemName: "homekit")
        vc2.tabBarItem.image = UIImage(systemName: "slider.horizontal.3")
        vc3.tabBarItem.image = UIImage(systemName: "doc")
        
        let selectedColor = UIColor.white
        let selectedAttributes = [NSAttributedString.Key.foregroundColor: selectedColor]
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, for: .selected)
        UITabBar.appearance().unselectedItemTintColor = .white
        
        
        
        // Do any additional setup after loading the view.
    }

    

  

}
