//
//  list.swift
//  homework4
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit
class list :NSObject,NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "nameKey")
        aCoder.encode(money, forKey: "moneyKey")
        aCoder.encode(listAvatar, forKey: "avatarKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "nameKey") as? String
        money = aDecoder.decodeObject(forKey: "moneyKey") as? String
        listAvatar = aDecoder.decodeObject(forKey: "avatarKey") as? UIImage
    }
    
    var name: String?
    var money: String?
    var listAvatar: UIImage?
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("List")
    init(name: String?,money: String?,listAvatar: UIImage?) {
        self.name=name
        self.money=money
        self.listAvatar = listAvatar
    }
}
