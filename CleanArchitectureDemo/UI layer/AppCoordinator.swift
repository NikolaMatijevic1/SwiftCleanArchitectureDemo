//
//  AppCoordinator.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 28/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import UIKit

class AppCoordinator {

    let window: UIWindow

    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds)) {
        self.window = window
    }

    func start() {
        let searchVC = SearchViewController()
        window.rootViewController = searchVC
        window.makeKeyAndVisible()
    }
}
