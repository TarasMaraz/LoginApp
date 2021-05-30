//
//  PhotoViewController.swift
//  LoginApp
//
//  Created by Тарас Панин on 30.05.2021.
//  
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet var firstPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPhoto.image = Storage.shared.myPhoto
    }
    
    
}
