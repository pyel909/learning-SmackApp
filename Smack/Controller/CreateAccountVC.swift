//
//  CreateAccountVC.swift
//  Smack
//
//  Created by pyel on 06/08/2018.
//  Copyright © 2018 pyel. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Actions
    @IBAction func closeBtnPressed(_ sender: Any){
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    @IBAction func chooseAvatarPressed(_ sender: Any) {
    }
    @IBAction func generateBgPressed(_ sender: Any) {
    }
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else { return }
        guard let password = passwordTxt.text, passwordTxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                print("Registered User !")
            }
        }
    }
    
    
}

