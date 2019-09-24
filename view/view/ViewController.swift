//
//  ViewController.swift
//  view
//
//  Created by Apple on 2019/9/24.
//  Copyright © 2019 qcx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var hintLabel: UILabel!
    
    @IBAction func loginButtonclick(_ sender: Any)
    {
        if((nameText.text=="susuuk")&&(passText.text=="123"))
        {
            hintLabel.isHidden=false
            hintLabel.text="login successful"
        }
        else
        {
            hintLabel.isHidden=false
            hintLabel.text="login failed"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

