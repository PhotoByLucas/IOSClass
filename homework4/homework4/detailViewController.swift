//
//  detailViewController.swift
//  homework4
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var moneyText: UITextField!
    var listForEdit: list?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.nameText.text=listForEdit?.name
        self.moneyText.text=listForEdit?.money
        
    }
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier=="saveToList"{
            print("save")
            listForEdit=list(name: self.nameText.text!,money: self.moneyText.text!)
        }
        if segue.identifier=="cancelToList"{
            print("cancel")
        }
    }
    

}
