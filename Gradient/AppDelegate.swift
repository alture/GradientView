//
//  AppDelegate.swift
//  Gradient
//
//  Created by Alisher on 03.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

