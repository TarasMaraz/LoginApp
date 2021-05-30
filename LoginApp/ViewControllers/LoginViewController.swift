//
//  LoginViewController.swift
//  LoginApp
//
// Created by Тарас Панин on 30.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private var user: UserData!
    private let storage = Storage.shared
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tapBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tapBarController.viewControllers else {return}
        
        for controller in viewControllers {
            switch controller {
            case let welcomVC as WelcomeViewController:
                welcomVC.userWelcomName = user.name
                
            case let navigationViewController as UINavigationController:
                 let navigationViewControllers = navigationViewController.viewControllers
                guard let infoVC = navigationViewControllers.first as? UserInfoViewController else { return }
                infoVC.userName = user.userInfo
                storage.myPhoto = user.photo
                
            default:
                break
            }
            
        }
        
    }
    
    // MARK: IBActions
    @IBAction func logInPressed() {
        guard let newUser = storage.users[userNameTextField.text!] else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: userNameTextField
            )
            return
        }
        if newUser.password == passwordTextField.text! {
            user = newUser
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        } else {
            showAlert(
                title: "Invalid password",
                message: "Please, enter correct password",
                textField: passwordTextField
            )
        }
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 10
            ? showAlert(title: "Oops!", message: "Your name is \(storage.users["Taras"]!.login) 😉")
            : showAlert(title: "Oops!", message: "Your password is \(storage.users["Taras"]!.password) 😉")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
}

// MARK: - Private Methods
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Alert Controller
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return true
    }
    
   
}

