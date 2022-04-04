//
//  LoginViewController.swift
//  AppLogin
//
//  Created by Enrick on 28/03/22.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
   
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any) {
        guard let email = emailTextField.text, email != "" else {
        presentMessage(message: "Campo de Email não preenchido")
            return
        }
        
        guard let password = passwordTextField.text, password != "" else {
            presentMessage(message: "Campo de senha obrigatorio")
            return
        }
        
        for user in userList {
            if user.email == email, user.password == password {
            let userDetailVC = UserDetailViewController(selectedUser: user)
                navigationController?.pushViewController(userDetailVC, animated: true)
            return
            }
             
        }
        presentMessage(message: "nenhum usuario cadastrado")
        
    }
        
        func presentMessage (message: String) {
            let alert = UIAlertController(title: "app de login", message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default , handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
        
    }


