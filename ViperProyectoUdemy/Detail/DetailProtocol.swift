//
//  DetailProtocol.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import Foundation


protocol DetailViewControllerProtocol: class {
    
    func update(dto: UserResult)
}


protocol DetailUseCaseinteractorProtocol: class  {
    
}


protocol DetailRouterProtocol: class {
    
    
}


protocol  DetailPresenterProtocol: class {
    func viewDidLoad()
    
    
}
