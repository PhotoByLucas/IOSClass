//
//  ViewController.swift
//  Helloworld
//
//  Created by Apple on 2019/9/10.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var showLabel1: UILabel!
    
    @IBOutlet weak var showLabel2: UILabel!
    @IBOutlet weak var nameText: UITextField!
    
    @IBAction func luyinButtonClick(_ sender: Any) {
        showLabel1.isHidden=true
        showLabel2.isHidden=false
        showLabel2.text="正在开启录音界面"
    }
    
    @IBAction func loginButtonClick(_ sender: Any) {
        if let userName = nameText.text{
            showLabel1.isHidden=false
            showLabel1.text="Welcome "+userName
        }
        if(nameText.text=="hua"){
            showLabel2.isHidden=false;
            showLabel2.text="正在读取hua的文件，请稍等"
        }
        else{
            showLabel2.isHidden=false;
            showLabel2.text="login false! "
        }
    }
    
    
}

