//
//  UserInfoViewController.swift
//  LoginApp
//
//  Created by Тарас Панин on 30.05.2021.

//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet var userInfo: UILabel!
    
    var userName: String!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        userInfo.text = userName
    }
  
}

