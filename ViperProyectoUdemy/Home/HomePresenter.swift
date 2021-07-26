//
//  HomePresenter.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/22/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import Foundation




class HomePresenter {
    
    
    weak var view: HomeViewProtocol?
    var interactor: HomeUseCaseInteractorProtocol
    var router: HomeRouterProtocol
    
    
    init( view: HomeViewProtocol,  interactor: HomeUseCaseInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension HomePresenter: HomePresenterProtocol {
   
    
    func viewDidLoad() {
        
        self.interactor.fetchRequest(count: 99) {
            (result) in
            switch(result){
            case .success(let data):
                
                guard let users = data as? Users,
                    let usersData = users.results else { return }
                
                
                self.view?.update(dto: usersData)
                
            case .failed(let error):
                print("error: \(String(describing: error))")
            }
        }
        
    }
    
    
    
    //paso 4 extender la funcion y llamar al metodo declarado en el HomePresenterProtocol
    func prepapreforRouter(user: UserResult) {
        // llamar al metodo declarado en el HomePresenterProtocol
        self.router.goToDetail(user: user)
    }
 
}
