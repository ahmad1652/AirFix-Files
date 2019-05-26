//
//  registerView.swift
//  AirFix
//
//  Created by Ahmad Mustafa on 4/29/19.
//  Copyright © 2019 Pixel. All rights reserved.
//

import UIKit
import Firebase

class registerView: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(endTypeNumber))
        view.addGestureRecognizer(tabGesture)    }
    
    @objc func endTypeNumber(){
        passwordText.endEditing(true)
        
    }
    
    @IBAction func registerText(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (suss, error) in
            if error != nil{
                print("Error create accountttt \(String(describing: error))")
            }else{
                print("Sucessful create account")
                self.performSegue(withIdentifier: "goToMain", sender: self)
            }
        }
        
    }
    
   
}
