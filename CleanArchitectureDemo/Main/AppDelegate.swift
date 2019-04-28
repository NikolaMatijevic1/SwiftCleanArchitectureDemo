//
//  AppDelegate.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 28/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator = AppCoordinator()
        appCoordinator?.start()
        return true
    }
}
