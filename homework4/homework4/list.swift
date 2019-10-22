//
//  list.swift
//  homework4
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
class list :NSObject,NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "nameKey")
        aCoder.encode(money, forKey: "moneyKey")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "nameKey") as? String
        money = aDecoder.decodeObject(forKey: "moneyKey") as? String

    }
    
    var name: String?
    var money: String?
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("List")
    init(name: String?,money: String?) {
        self.name=name
        self.money=money
    }
}
