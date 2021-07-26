//
//  HomeRouter.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/22/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit




class HomeRouter {
    
    var view: UIViewController
    init(view: UIViewController) {
        self.view = view
    }
    
}

extension HomeRouter: HomeRouterProtocol{

//paso 2 extender la funcion y llamar a la tabla detalle
    func goToDetail(user: UserResult) {
       // let vc = DetailViewController(nibName: "DetailViewController", bundle: Bundle.main)
       // vc.userData = user
        
        
        /**una forma de cambiar de visa*/
       // self.view.present(vc, animated: true)
        
        
       /**tipos de transicion*/
        //vc.modalTransitionStyle = .crossDissolve
       // vc.modalTransitionStyle = .flipHorizontal
  
        
        /**segunda  forma de cambiar de visa*/
        let vc = DetailAssembly.build(dto: user)
        self.view.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
}
