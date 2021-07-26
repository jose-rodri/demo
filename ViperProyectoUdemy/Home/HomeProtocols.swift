//
//  HomeProtocols.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/22/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit
import Alamofire


protocol HomeViewProtocol: class {

    func update(dto: [UserResult])

}

protocol  HomePresenterProtocol{
    func viewDidLoad()
        
    // paso 3 : crear la funcion para elegeir el item a cualse desea pasar
    func prepapreforRouter(user: UserResult)

}

protocol HomeUseCaseInteractorProtocol {
    
    func fetchRequest(count: Int, callback: @escaping ServiceCompletion)
    
}

protocol HomeRouterProtocol {
    //paso 1 crear la el metodo func para pasar a la vista detalle
    func goToDetail(user: UserResult)
    
}



