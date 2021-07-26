//
//  DetailPresenter.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import Foundation


class DetailPresenter {
    
    weak var view: DetailViewControllerProtocol?
    var interactor: DetailUseCaseinteractorProtocol
     var router: DetailRouterProtocol
     init(view: DetailViewControllerProtocol, interactor: DetailUseCaseinteractorProtocol, router: DetailRouterProtocol) {
         self.view = view
         self.interactor = interactor
         self.router = router
     }
     
     
    
 
 
    
    
    
}


extension DetailPresenter : DetailPresenterProtocol {
    func viewDidLoad() {
        
    }
    
    
}
