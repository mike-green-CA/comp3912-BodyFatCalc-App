//
//  AppRouter.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-07-12.
//

import UIKit

class AppRouter {
    
    static func navigate(to vc : UIViewController){
        
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            
            let nc = UINavigationController(rootViewController: vc)
            sceneDelegate.window?.rootViewController = nc
        }
   
    }
}
