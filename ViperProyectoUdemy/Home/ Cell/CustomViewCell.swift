//
//  CustomViewCell.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/23/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit
import Kingfisher

class CustomViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mView: UIView!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var gender: UILabel!
    
    @IBOutlet weak var age: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureShadow(view: mView , image: imgView,cornerRadius: 38, map: nil)
//         //configureShadow()
//        imgView.layer.cornerRadius = 40
//        imgView.layer.borderColor = UIColor.systemBlue.cgColor
//        imgView.layer.borderWidth = 4
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    
    }
    
    
    func configureCell(user: UserResult, index: Int){
        
        guard let name =  user.name?.first,
            let surname = user.name?.last,
            let gender = user.gender,
            let age = user.dob?.age ,
            let imageMedium = user.picture?.medium
            else {
                return
        }
        
        
        self.name.text = "\(index) -Nombre:  \(name) \(surname) "
        self.gender.text = "genero:  \(gender)"
        self.age.text = "Edad:  \(age) "
        loadImage(imageNamed: imageMedium)
        
       /* let url = URL(string: imageMedium)
         let data = try? Data(contentsOf: url!)
         self.imageView?.image = UIImage(data: data!)*/
    }
    
    
//    func  configureShadow(){
//        self.mView.layer.cornerRadius = 8.0
//        self.mView.layer.shadowColor = UIColor.gray.cgColor
//        self.mView.layer.shadowOffset = CGSize.zero
//        self.mView.layer.cornerRadius = 8.0
//        self.mView.layer.shadowOpacity = 1.6
//    }
    
    override func prepareForReuse() {
        self.imgView.image = nil
        self.name.text = ""
        self.gender.text = ""
         self.age.text = ""
    }
    //cargar imageenes libreria kingfisher
    func loadImage(imageNamed: String) {
        let url = URL(string: imageNamed)
         let processor = RoundCornerImageProcessor(cornerRadius: 20)
        imgView.kf.indicatorType = .activity
        imgView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        /**, completionHandler:
         {
             result in
             switch result {
             case .success(let value):
                 print("Task done for: \(value.source.url?.absoluteString ?? "")")
             case .failure(let error):
                 print("Job failed: \(error.localizedDescription)")
             }
         })*/

    }
    
}
