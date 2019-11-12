//
//  SignupViewController.swift
//  moneyHelper
//
//  Created by Apple on 2019/11/12.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var account: UITextField!
    
    @IBOutlet weak var password: UITextField!

    @IBAction func save(_ sender: Any) {
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func saveData(){
        
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
