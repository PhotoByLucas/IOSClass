//
//  detailViewController.swift
//  text
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 qhp. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var number: UITextField!
    var textForEdit:text?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = textForEdit?.name
        self.number.text = textForEdit?.number
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList"{
            print("save")
            textForEdit=text(name: self.name.text!,
                             number: self.number.text!)
        }
        if segue.identifier == "cancelToList"{
            print("cancel")
        }
    }
    

}
