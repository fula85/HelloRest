//
//  LoginViewController.swift
//  HelloRest
//
//  Created by mobapp06 on 29/01/2019.
//  Copyright © 2019 EhB. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var swiRemember: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // opvragen waarden uit de settings
        let settings = UserDefaults.standard
        //waarde uit settings gebruiken om scherm in te stellen
        tfUsername.text = settings.string(forKey: "pref_username")
        tfPassword.text = settings.string(forKey: "pref_password")
        swiRemember.setOn(settings.bool(forKey: "pref_remember"),  animated:false)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(tfUsername.text!.count >= 6 && tfPassword.text!.count >= 4){
            return true
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let settings = UserDefaults.standard
        if swiRemember.isOn {
            //waarde naar settings wegschrijven
            settings.set(tfUsername.text, forKey: "pref_username")
            settings.set(tfPassword.text, forKey: "pref_password")
        }else{
            settings.set(false, forKey: "pref_remember")
            settings.set("", forKey: "pref_username")
            settings.set("", forKey: "pref_password")
        }
    }
    
}


    



