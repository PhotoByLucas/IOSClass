//
//  LoginViewController.swift
//  moneyHelper
//
//  Created by Apple on 2019/11/12.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var hintLabel: UILabel!
    
    @IBOutlet weak var account: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(_ sender: Any) {
        if ( ( account.text == "sun") && ( password.text == "123") ){
        let view = self.storyboard?.instantiateViewController(withIdentifier: "UITabBarController")as!UITabBarController
        self.present(view, animated: true, completion: nil)
        }
        else if ((account.text != "sun") && ( password.text == "123")){
            hintLabel.isHidden = false
            hintLabel.text = "账号错误"
        }
        else if ((account.text == "sun") && ( password.text != "123")){
            
            hintLabel.isHidden = false
            hintLabel.text = "密码错误"
        }
        else if ((account.text == nil) && ( password.text == nil)){
             self.dismiss(animated: false, completion: nil)
            hintLabel.isHidden = false
            hintLabel.text = "请输入账号和密码"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
