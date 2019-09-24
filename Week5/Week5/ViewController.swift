//
//  ViewController.swift
//  Week5
//
//  Created by Lucas on 2019/9/24.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let initView=UIView(frame:CGRect(x:0,y:0,width:300,height:300))
        initView.backgroundColor=UIColor.green
        self.view=initView
        
        let secondView=UIView(frame:CGRect(x:0,y:0,width:300,height:300))
        secondView.backgroundColor=UIColor.red
        self.view.addSubview(secondView)
        
        let labelView = UILabel(frame:CGRect(x:0,y:0,width:100,height:200))
        labelView.text="hello world"
        labelView.backgroundColor=UIColor.blue
        self.view.addSubview(labelView)
    }


}

