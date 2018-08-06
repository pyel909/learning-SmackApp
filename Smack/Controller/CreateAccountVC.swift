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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Actions
    @IBAction func closeBtnPressed(_ sender: Any){
        
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    
    }
    
}

