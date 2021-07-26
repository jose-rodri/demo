//
//  NavigationBuilder.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit

typealias  NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
    //metodo suficiente para hacer la navegacion
    static func Builder(rootview: UIViewController) -> UINavigationController {
        
        let navigationControler = UINavigationController(rootViewController: rootview)
        
        
       
         //metodo para darle color forma y estilo al tituclo del controlador
         
       //  navigationControler.navigationBar.tintColor = UIColor.systemBlue


         let font = UIFont.systemFont(ofSize: 30)
         let shadow = NSShadow()
        //shadow.shadowColor =
         shadow.shadowBlurRadius = 6

         let atributes: [NSAttributedString.Key: Any] = [
             .font: font,
            .foregroundColor: UIColor.brown,
             .shadow: shadow

         ]

         let fontLarge = UIFont.systemFont(ofSize: 60)

         let atributesLarge: [NSAttributedString.Key: Any] = [
             .font: fontLarge,
             .foregroundColor: UIColor.brown,
             .shadow: shadow

         ]

         navigationControler.navigationBar.titleTextAttributes = atributes
         navigationControler.navigationBar.largeTitleTextAttributes = atributesLarge
         navigationControler.navigationBar.prefersLargeTitles = true
         
         
        return navigationControler
    }
    
}
        
   
