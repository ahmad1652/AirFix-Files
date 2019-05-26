//
//  loginView.swift
//  AirFix
//
//  Created by Ahmad Mustafa on 4/29/19.
//  Copyright © 2019 Pixel. All rights reserved.
//

import UIKit
import Firebase

class loginView: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(endTypeNumber))
        view.addGestureRecognizer(tabGesture)
    }
    @objc func endTypeNumber(){
        passwordText.endEditing(true)
        
    }
    
    @IBAction func loginBTN(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (succ, error) in
            if error != nil{
                print("Error cause \(String(describing: error))")
            }else{
                self.performSegue(withIdentifier: "goToMain", sender: self)
            }
        }
    }
    
}
