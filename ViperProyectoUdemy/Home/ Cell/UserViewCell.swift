//
//  UserViewCell.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit
import Kingfisher

class UserViewCell: UITableViewCell {



    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var myName: UILabel!
    
    @IBOutlet weak var miAge: UILabel!
    //tamaño
    static var statimaredHeight: CGFloat = 250.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        //llama a la extension para darle borde y sombre a la celda
        configureShadow(view: myView, image: myImage, cornerRadius: 40,map: nil)
        
        animationCell(view: myView, duration: 0.3)
        
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //para que la celda no repita
    override func prepareForReuse() {
        self.myImage.image = nil
        self.myName.text = ""
        self.miAge.text = ""
        
    }
    
    
    func configureCellUser(user: UserResult){
        
        guard let name =  user.name?.first,
            let surname = user.name?.last,
            let age = user.dob?.age ,
            let imageMedium = user.picture?.large
            else {
                return
        }
        
        self.myName.text = "Nombre:  \(name) \(surname)"
        self.miAge.text = "Edad:  \(age) "
        loadImage(imageNamed: imageMedium)
    }
    
    
    
    func loadImage(imageNamed: String) {
        let url = URL(string: imageNamed)
         let processor = RoundCornerImageProcessor(cornerRadius: 10)
        myImage.kf.indicatorType = .activity
        myImage.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    
    
    
    
    
    
    
}
