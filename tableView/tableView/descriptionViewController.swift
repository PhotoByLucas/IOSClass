//
//  descriptionViewController.swift
//  tableView
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 qcx. All rights reserved.
//

import UIKit

class descriptionViewController: UIViewController {
    
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptText: UITextField!
    
    var foodForEdit :food?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameText.text=foodForEdit?.name
        self.descriptText.text=foodForEdit?.foodDescription
    
        // Do any additional setup after loading the view.
    //    self.nameText.text=foodForEdit?.name
    //    self.descriptionText.text=foodForEdit?.description
       // self.navigationItem.title=foodForEdit?.name
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier=="saveToList"
        {
            print("sace")
            foodForEdit=food(name: self.nameText.text!, foodDescription: self.descriptText.text!)
        }
        if segue.identifier=="cancelToList"
        {
            print("cancel")
        }
    }
   

}
