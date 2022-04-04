//
//  User.swift
//  AppLogin
//
//  Created by Enrick on 28/03/22.
//

import UIKit

class User {
    
    let name: String
    let email: String
    let password: String
    var image : UIImage?
    
    init (userName: String, userEmail: String, userPassword: String){
    name = userName
    email = userEmail
    password = userPassword
        
    }

}

