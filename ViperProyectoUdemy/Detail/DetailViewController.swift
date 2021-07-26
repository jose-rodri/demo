//
//  DetailViewController.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/27/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit

import FrameworkEhCOS

enum UserDetailCell {
    case user
    case conctac
    case map
    case test
}

class DetailViewController: UIViewController {
    
    
    //datos obtenidos
    var userData:  UserResult?
    
    @IBOutlet weak var tableViewDetail: UITableView!
    
    
    var presenter: DetailPresenter?
    
    
    private let mCellTypes = [UserDetailCell.user, UserDetailCell.conctac, UserDetailCell.map , UserDetailCell.test]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        //  navBarReturn()
    }
    
  
    
}





extension DetailViewController: DetailViewControllerProtocol {
    func update(dto: UserResult) {
        //obenemos los datos obtenidos y lo cargamos al dto
        userData = dto
    }
    
}

extension DetailViewController: UITableViewDelegate {
    
    func configureTableView() {
        self.tableViewDetail.delegate = self
        self.tableViewDetail.dataSource = self
        self.tableViewDetail.register(UINib(nibName: "UserViewCell", bundle: nil), forCellReuseIdentifier: "UserViewCell")
        self.tableViewDetail.register(UINib(nibName: "ContactViewCell", bundle: nil), forCellReuseIdentifier: "ContactViewCell")
        self.tableViewDetail.register(UINib(nibName: "MapViewCell", bundle: nil), forCellReuseIdentifier: "MapViewCell")
        self.tableViewDetail.register(UINib(nibName: "LibraryTableViewCell", bundle: nil), forCellReuseIdentifier: "LibraryTableViewCell")
    }
    
}



extension DetailViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mCellTypes.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //  let cell = tableView.dequeueReusableCell(withIdentifier: "ContactViewCell", for: indexPath) as! ContactViewCell
        //  cell.textLabel?.text =  userData?.email
        //  return cell
        
        switch mCellTypes[indexPath.row] {
        case .user:
            return cellUser(tableView: tableView, indexPath: indexPath)
        case .conctac:
            return cellContact(tableView: tableView, indexPath: indexPath)
        case .map:
            return cellMap(tableView: tableView, indexPath: indexPath)
            
        case .test:
            return  cellLibrary(tableView: tableView, indexPath: indexPath)
        }
        
    }
    
    
     //para darle tamaño a la celda
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CGFloat {
         
         switch mCellTypes[indexPath.row] {
         case .user:
            return UserViewCell.statimaredHeight
         case .conctac:
             return ContactViewCell.statimaredHeight
         case .map:
             return MapViewCell.statimaredHeight
         case .test:
            return LibraryTableViewCell.libraryTHeight
            }
     }
     
     
     
    
 
    private func cellUser (tableView: UITableView, indexPath: IndexPath) -> UserViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserViewCell", for: indexPath  ) as! UserViewCell
        
        if let  user = userData {
            cell.configureCellUser(user: user)
        }
        
        return cell
        
    }



    private func cellContact (tableView: UITableView, indexPath: IndexPath) -> ContactViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactViewCell", for: indexPath  ) as! ContactViewCell
        
        
        if let  user = userData {
            cell.configureCellContact(user: user)
        }
        
        return cell
    }



    
    private func cellMap (tableView: UITableView, indexPath: IndexPath) -> MapViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapViewCell", for: indexPath  ) as! MapViewCell
        if let  user = userData {
            cell.configureCellMap(user: user)
        }
        
        return cell
        
    }

    
    
    
    private func cellLibrary (tableView: UITableView, indexPath: IndexPath) -> LibraryTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTableViewCell", for: indexPath  ) as! LibraryTableViewCell
        
        cell.delegate = self
        return cell
        
    }
    
    
    
    
    
}





extension DetailViewController : delegateAction {
    func buttonAction() {
        
        let login = LoginRouter.createModule()
        login.modalPresentationStyle = .fullScreen
        self.present(login, animated: true, completion: nil)
        
        
    
        
    }
    
    
}
