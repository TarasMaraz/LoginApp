//
//  UserData.swift
//  LoginApp
//
//  Created by Тарас Панин on 30.05.2021.
// 
//

import UIKit

struct UserData {
    let login: String
    let password: String
    let name: String
    let userInfo: String
    let photo: UIImage?
}



let taras = UserData(login: "Taras", password: "123", name: "Taras Panin", userInfo: "Taras Panin \nAge: 26 \nMy hobby: Snowboard \n ", photo: UIImage(named: "tarasPhoto") )


let user = UserData(login: "User", password: "User", name: "User", userInfo: "User", photo: UIImage(named: "photo"))
