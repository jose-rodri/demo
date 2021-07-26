//
//  DetailAssembly.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit

class  DetailAssembly {
    
    static func build(dto: UserResult) -> UIViewController {
        
        let view = DetailViewController(nibName: "DetailViewController", bundle: Bundle.main)
        
        let interactor = DetailInteractor()
        let rotuer = DetailRouter(view: view)
        let presenter = DetailPresenter(view: view, interactor: interactor, router: rotuer)
        view.presenter = presenter
        view.update(dto: dto)
        
        return view
    }
    
}
