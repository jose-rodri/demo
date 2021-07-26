//
//  ViewController.swift
//  ViperProyectoUdemy
//
//  Created by Jose Leoncio Quispe Rodriguez on 9/22/20.
//  Copyright © 2020 Jose Leoncio Quispe Rodriguez. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var presenter: HomePresenter?
    
    
    var userData:  [UserResult] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pasaje"
        configureTableCell()
        self.presenter?.viewDidLoad()
    }

}



    
    
    
extension HomeViewController: HomeViewProtocol {
    func update(dto: [UserResult]) {
        userData = dto
        
        self.tableView.reloadData()
        //* recorriendo para lista los datos de la API*/
//        userData.forEach{(user) in
//            if let userMail = user.email {
//                  print(userMail)
//              }
//        }
//        
    }
    
    
}


extension HomeViewController: UITableViewDelegate {
    
    func configureTableCell(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "CustomViewCell", bundle: nil), forCellReuseIdentifier: "CustomViewCell")
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomViewCell", for: indexPath) as! CustomViewCell
        let user = userData[indexPath.row]
        
        
        cell.configureCell(user: user, index: indexPath.row + 1)
        
        
        return cell
        
        
    }
    
    
    
    //paso 5 :  crear la funcion que erar de view conroller didSelectRowAt
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.presenter?.prepapreforRouter(user: userData[indexPath.row])
    }
    

}
