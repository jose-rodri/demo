//
//  MapViewCell.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit
import MapKit

class MapViewCell: UITableViewCell {

    
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var mapaView: MKMapView!
    
    
    static var statimaredHeight: CGFloat = 450.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureShadow(view: myView, image: nil, cornerRadius: 65.0 , map: mapaView)
        animationCell(view: myView, duration: 0.9)
    }
    
    
    
    
    func configureCellMap(user: UserResult){
        
        guard let latitud =  user.location?.coordinates?.latitude,
              let longitud = user.location?.coordinates?.longitude,
              let city = user.location?.city,
              let state = user.location?.state,
              let name = user.name?.first
            else {
                return
        }
        
        if let lat = Double(latitud) , let lon = Double(longitud) {
            let location = CLLocationCoordinate2DMake(lat, lon)
            loadMap(location: location, name: name, city: city, state: state)
        }
    
        
        
    }
    
    
    func loadMap(location: CLLocationCoordinate2D, name: String, city: String, state: String){
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapaView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "\(name) es de : \(city.capitalized) en \(state.capitalized)"
        annotation.subtitle = " \(state.capitalized)"
        mapaView.addAnnotation(annotation)
        
      let mapCamara = MKMapCamera(lookingAtCenter: location, fromDistance: 1000000 , pitch: 65, heading: 0)
        mapaView.setCamera(mapCamara, animated: true)
        
    }
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
