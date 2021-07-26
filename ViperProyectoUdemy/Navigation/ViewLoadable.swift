//
//  ViewLoadable.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import Foundation

protocol ViewLoadable: AnyObject {
    static var nibName: String { get }
}

extension ViewLoadable {
    
    static func loadNibName() -> Self {
        
        return loadNibName(from: Bundle.init(for: self))
    }
    
    static func loadNibName(from bundle: Bundle) -> Self {
        
        return bundle.loadNibNamed( self.nibName, owner: nil, options: nil)?.first as! Self
        
    }
    
}
