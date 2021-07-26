
//
//  HomeAssebly.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/22/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class HomeAssembly {
    
    
    static func buildNavigation(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
       
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        
        let interactor = HomeInteractor()
        let router = HomeRouter(view: view)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
      //  view.view.backgroundColor = .green
        
        
        return factory(view)
    }
    
//    static func build() -> UIViewController {
//        
//        
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let view = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
//        
//        let interactor = HomeInteractor()
//        let router = HomeRouter(view: view)
//        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
//        
//        view.presenter = presenter
//        view.view.backgroundColor = .blue
//        
//        
//        return view
//    }
    
    
    
}
