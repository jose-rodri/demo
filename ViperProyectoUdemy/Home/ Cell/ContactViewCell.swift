//
//  ContactViewCell.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit
import Kingfisher
import MessageUI

class ContactViewCell: UITableViewCell {
    
   
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    
    
    //tamaño
    static var statimaredHeight: CGFloat = 150.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
      configureShadow(view: myView, image: nil, map: nil)
        animationCell(view: myView, duration: 0.6)
        tapPhone()
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

  
    
    
    
    func configureCellContact(user: UserResult){
        
        guard let phone =  user.phone,
              let email = user.email
            else {
                return
        }
        
        self.phone.text = "Phone: \(phone)"
        self.email.text = " \(email) "
        
    }
    
    
}

extension ContactViewCell : MFMailComposeViewControllerDelegate {
    func tapPhone(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(ContactViewCell.tapEmailFunction))
        email.isUserInteractionEnabled = true
        email.addGestureRecognizer(tap)


    }

    @objc func tapEmailFunction(sender: UITapGestureRecognizer) {
        print("tab seleccionado")
        
        if MFMailComposeViewController.canSendMail() {
            
              let mail = MFMailComposeViewController()
              mail.mailComposeDelegate = self
            
            if let email = email.text {
                 mail.setToRecipients([email])
                  mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
                let window = UIApplication.shared.windows.filter{
                    $0.isKeyWindow }.first
                window?.rootViewController?.present(mail, animated: true, completion: nil)
            }
            
            
        
          } else {
            
            let alert = UIAlertController(title: "Email no esta funcionando", message: "Ha fallado el enviar email", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            
            
            let window = UIApplication.shared.windows.filter{
                $0.isKeyWindow
            }.first
            
            window?.rootViewController?.present(alert, animated: true, completion: nil)
            
          }
        
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }

}
