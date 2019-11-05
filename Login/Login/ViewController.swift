//
//  ViewController.swift
//  Login
//
//  Created by Apple on 2019/9/24.
//  Copyright © 2019 qhp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var passWord: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func exitToHere(segue :
    UIStoryboardSegue) {
    print("to")
    }

    @IBAction func login(_ sender: Any) {
        if ( ( account.text == "sun") && ( passWord.text == "123") ){
hintLabel.isHidden = false
            hintLabel.text = "登录成功"
        }
        else{
            hintLabel.isHidden = false
            hintLabel.text = "登录失败"
        }
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        hintLabel.isHidden = false
        hintLabel.text = "准备修改密码"
    }
}

