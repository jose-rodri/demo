//
//  ExtencionViewCell.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/23/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit
import MapKit

extension UITableViewCell {
    
    
    func  configureShadow(view: UIView , image: UIImageView? , cornerRadius: CGFloat = 40 , map: MKMapView?){
       view.layer.cornerRadius = 8.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize.zero
        view.layer.cornerRadius = 8.0
       view.layer.shadowOpacity = 1.6
        
        
        
        image?.layer.cornerRadius = cornerRadius
        image?.layer.borderColor = UIColor.systemBlue.cgColor
        image?.layer.borderWidth = 4
        
        
        map?.layer.cornerRadius = 16.0
    }
    
   
    
    ///animacion para que la celda cargue de uno en uno
    
    func animationCell(view: UIView, duration: Double){
        
        view.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: duration, animations: {
            view.transform = CGAffineTransform(scaleX: 1.0, y:  1.0)
        }, completion: nil)
        
    }
    
    
    
    
}
