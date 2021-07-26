//
//  DetailRouter.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit

class DetailRouter {
    
    var view: UIViewController
    init(view: UIViewController) {
        self.view = view
    }
}


extension DetailRouter  : DetailRouterProtocol {
    
}
