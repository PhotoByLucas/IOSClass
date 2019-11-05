//
//  foodTableViewCell.swift
//  tableView
//
//  Created by Apple on 2019/10/29.
//  Copyright © 2019 qcx. All rights reserved.
//

import UIKit

class foodTableViewCell: UITableViewCell{

   /* @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptText: UITextField!
    @IBOutlet weak var foodImage:UIImageView?*/
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var descriptText: UILabel!
    @IBOutlet weak var nameText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
