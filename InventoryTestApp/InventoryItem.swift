//
//  InventoryItem.swift
//  Inventory
//
//  Created by David Norman on 8/15/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import Foundation


enum InventoryItemName: String {
    case sword_diamond = "sword_diamond"
    case flail_bronze = "flail_bronze"
    case hammer_gold = "hammer_gold"
    case ore_emerald = "ore_emerald"
    case ore_iron = "ore_iron"
    case ore_ruby = "ore_ruby"
    case ore_gold = "ore_gold"
    case pick_silver = "pick_silver"
    case stew = "stew"
    case sword_gold = "sword_gold"
    case sword_silver = "sword_silver"
    case wheat = "wheat"
    case ore_diamond = "ore_diamond"
    case trunk_top = "trunk_top"
    case stone = "stone"
    case upStairs = "upStairs"
    case downStairs = "downStairs"
    case hoe_bronze = "hoe_bronze"
    case seed = "seed"
    case headArmor = "headArmor"
    case bodyArmor = "bodyArmor"
    case legArmor = "legArmor"
    case footArmor = "footArmor"
    case leftHandArmor = "leftHandArmor"
    case rightHandArmor = "rightHandArmor"
    case empty = "empty"
    
}

enum InventoryItemType: String {
    case weapon = "weapon"
    case armor = "armor"
    case other = "other"
}

class InventoryItem: NSObject, NSCopying, NSCoding {
    
    var name: InventoryItemName?
    var imageName: String?
    var numberInStack = 0
    var itemType: InventoryItemType!
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name?.rawValue, forKey: "Item-name")
        aCoder.encodeObject(imageName, forKey: "Item-imageName")
        aCoder.encodeInteger(numberInStack, forKey: "Item-numberInStack")
        aCoder.encodeObject(itemType.rawValue, forKey: "Item-itemType")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = InventoryItemName(rawValue: aDecoder.decodeObjectForKey("Item-name") as! String)
        self.imageName = aDecoder.decodeObjectForKey("Item-imageName") as? String
        self.numberInStack = aDecoder.decodeIntegerForKey("Item-numberInStack")
        self.itemType = InventoryItemType(rawValue: aDecoder.decodeObjectForKey("Item-itemType") as! String)
        
    }
    
    
    init(name: InventoryItemName, itemType: InventoryItemType) {
        self.name = name
        self.imageName = name.rawValue
        self.itemType = itemType
    }
    
    init(name: InventoryItemName, numberInStack:Int, itemType: InventoryItemType) {
        self.name = name
        self.imageName = name.rawValue
        self.numberInStack = numberInStack
        self.itemType = itemType
    }
    
    init(name: InventoryItemName) {
        self.name = name
        self.imageName = name.rawValue
        self.itemType = InventoryItemType.other
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return InventoryItem(name: self.name!, numberInStack:self.numberInStack, itemType: self.itemType)
    }
}