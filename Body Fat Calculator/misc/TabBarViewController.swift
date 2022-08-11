//
//  TabBarViewController.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-07-12.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVC = MainViewController()
        let historyVC = HistoryViewController()

        viewControllers = [mainVC, historyVC]
        
        tabBar.backgroundColor = UIColor(named: "#252525")
    }
    
    
    
}
