//
//  UserDetailViewController.swift
//  AppLogin
//
//  Created by Enrick on 30/03/22.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    let user: User
    
    init(selectedUser: User) {
        user = selectedUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.name
        ImageView.image = user.image

    }
}
