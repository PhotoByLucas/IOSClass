//
//  text.swift
//  text
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 qhp. All rights reserved.
//

import Foundation
import UIKit
class text: NSObject, NSCoding
{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey:"nameKey")
        aCoder.encode(number, forKey:"numberKey")
        aCoder.encode(textAvatar,forKey:"textAvatarKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "nameKey")as? String
        number = aDecoder.decodeObject(forKey: "numberKey")as? String
        textAvatar = aDecoder.decodeObject(forKey: "textAvatarKey")as? UIImage
    }
    
    var name: String?
    var number: String?
    var textAvatar:UIImage?
    
    //add dociment path
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("textList")
    init (name :  String?,number: String?,textAvatar:UIImage?){
        self.name =  name
        self.number = number
        self.textAvatar = textAvatar
    }
}
