//
//  InventoryItem.swift
//  Inventory
//
//  Created by David Norman on 8/15/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import Foundation


enum InventoryItemName: String {
    case flail_bronze = "flail_bronze"
    case hammer_gold = "hammer_gold"
    case ore_ruby = "ore_ruby"
    case pick_silver = "pick_silver"
    case stew = "stew"
    case sword_silver = "sword_silver"
    case empty = "empty"
    
}

class InventoryItem: NSObject, NSCopying, NSCoding {
    
    var name: InventoryItemName?
    var imageName: String?
    var numberInStack = 0
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name?.rawValue, forKey: "Item-name")
        aCoder.encodeObject(imageName, forKey: "Item-imageName")
        aCoder.encodeInteger(numberInStack, forKey: "Item-numberInStack")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = InventoryItemName(rawValue: aDecoder.decodeObjectForKey("Item-name") as! String)
        self.imageName = aDecoder.decodeObjectForKey("Item-imageName") as? String
        self.numberInStack = aDecoder.decodeIntegerForKey("Item-numberInStack")
        
    }
    
    init(name: InventoryItemName) {
        self.name = name
        self.imageName = name.rawValue
    }
    
    init(name: InventoryItemName, numberInStack:Int) {
        self.name = name
        self.imageName = name.rawValue
        self.numberInStack = numberInStack
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return InventoryItem(name: self.name!, numberInStack:self.numberInStack)
    }
}