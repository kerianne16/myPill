//
//  AppDelegate.swift
//  myPill
//
//  Created by Keri Levesque on 2/2/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

 var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        center.requestAuthorization(options: options) { (granted, error) in
            if granted {
                application.registerForRemoteNotifications()
            }
        }
        // Override point for customization after application launch.
     self.window = UIWindow(frame: UIScreen.main.bounds)
            if let window = self.window {
                window.backgroundColor = UIColor.white
                let nav = UINavigationController()
                let mainView = AddViewController()
                nav.viewControllers = [mainView]
                window.rootViewController = nav
                window.makeKeyAndVisible()
            }
            
            return true
        }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

