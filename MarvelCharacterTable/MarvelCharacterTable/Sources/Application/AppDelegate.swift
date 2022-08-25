//
//  AppDelegate.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 23/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tableScreen = TableViewScreenView()
        
        let navigationController = UINavigationController(rootViewController: tableScreen)
        
        navigationController.setViewControllers([tableScreen], animated: true)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

