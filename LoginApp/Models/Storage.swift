//
//  PhotoStorage.swift
//  LoginApp
//
//  Created by Тарас Панин on 30.05.2021.
// 
//

import UIKit

class Storage {
    static let shared = Storage()
    var users = [taras.login: taras, user.login: user]
    var myPhoto: UIImage!
    private init() {}
}
