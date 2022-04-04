//
//  ViewController.swift
//  AppLogin
//
//  Created by Enrick on 28/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToLogin(_ sender: Any) {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    
    }
    
    @IBAction func goToSignUp(_ sender: Any) {
        let signupVC = SignUpViewController()
        navigationController?.pushViewController(signupVC, animated: true)
        
    }
}

