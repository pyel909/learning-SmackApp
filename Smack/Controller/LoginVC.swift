//
//  LoginVC.swift
//  Smack
//
//  Created by pyel on 06/08/2018.
//  Copyright © 2018 pyel. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //Outlets
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //Actions
    @IBAction func closeBtnPressed(_ sender: Any){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
         
    }
    
}
