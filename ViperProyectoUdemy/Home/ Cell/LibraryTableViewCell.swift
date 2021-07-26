//
//  LibraryTableViewCell.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 7/25/21.
//  Copyright © 2021 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit

protocol delegateAction: class {
    func buttonAction()
}
class LibraryTableViewCell: UITableViewCell {

    weak var delegate : delegateAction?
    
    static var libraryTHeight: CGFloat = 450.0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btn(_ sender: Any) {
        delegate?.buttonAction()
        
    }
}
