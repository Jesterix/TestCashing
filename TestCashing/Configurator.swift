//
//  Configurator.swift
//  TestCashing
//
//  Created by Georgy Khaydenko on 30.08.2020.
//  Copyright © 2020 Georgy Khaydenko. All rights reserved.
//

import UIKit

class Configurator {
    func createMain() -> ViewController {
        return ViewController()
    }
    
    func createSecond(with text: String = "") -> SecondViewController {
        let vc = SecondViewController()
        vc.textField.text = text
        return vc
    }
    
    func createController(from state: AppState) -> UINavigationController {
        let navC = UINavigationController(rootViewController: createMain())
        var controllersStack: [UIViewController] = []
        switch state.screen {
        case 0:
            controllersStack = [createMain()]
        case 1:
            controllersStack = [createMain(), createSecond(with: state.text)]
        default:
            controllersStack = [createMain()]
        }
        
        navC.setViewControllers(controllersStack, animated: false)
        return navC
    }
}

extension UIViewController {
    /// Creates a navigation controller with current root view controller and returns it
    func wrappedInNavigationController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: self)
        return navigationController
    }
}
