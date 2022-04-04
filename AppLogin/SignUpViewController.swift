//
//  SignUpViewController.swift
//  AppLogin
//
//  Created by Enrick on 28/03/22.
//

import UIKit

var userList: [User] = []

class SignUpViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate{

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var passwordConfTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFiels()
               
    }
    
    func setupTextFiels () {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passWordTextField.delegate = self
        passwordConfTextField.delegate = self
        
    }

    @IBAction func signUp(_ sender: Any) {
        let name = nameTextField.text
        let email = emailTextField.text
        let password = passWordTextField.text
        
        guard let userName = name, userName != "" else {
            presentMessage(message: "Campo de nome deve ser preenchido")
            return
        }
        guard let userEmail = email, userEmail != "" else {
          presentMessage(message: "Campo de email deve ser preenchido")
            return
        }
        guard let userPassword = password, userPassword != "" else {
            presentMessage(message: "Campo de senha deve ser preenchido")
            return
        }
        guard let userpasswordConf = passwordConfTextField.text , userpasswordConf != "" else       {
            presentMessage(message: "Campo de confirmação deve ser preenchido")
            return
        }
        guard userPassword == userpasswordConf else {
            presentMessage(message: "Confirmação de senha incorreto")
            return
        }
        let user = User(userName: userName, userEmail: userEmail, userPassword: userPassword)
        user.image = imageView.image
        userList.append(user)
        presentMessage(message: "Usuário \(userName) cadastrado")
    
    }
    
    func presentMessage (message: String) {
        let alert = UIAlertController(title: "app de login", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default , handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
            
        }
    
    @IBAction func selectImage(_ sender: Any){
        let alert = UIAlertController(title: "app de login", message: "Selecione uma opção", preferredStyle: .actionSheet )
        
        let cameraButton = UIAlertAction(title: "Camera", style: .default) { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        alert.addAction(cameraButton)

        let libraryButton = UIAlertAction(title: "Biblioteca de fotos", style: .default) { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
            alert.addAction(libraryButton)
        
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelButton)

        
        present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as? UIImage
        if let image = selectedImage {
        imageView.image = image
        }   else {presentMessage(message: "Você deve selecionar uma imagem")
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
        

