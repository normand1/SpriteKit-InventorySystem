//
//  InventoryItem.swift
//  Inventory
//
//  Created by David Norman on 8/15/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import Foundation

enum WeaponType: String {
    case sword = "sword"
    case axe = "axe"
    case hammer = "hammer"
}

enum ElementType: String {
    case emerald = "emerald"
    case diamond = "diamond"
    case ruby = "ruby"
    case steel = "steel"
    case wood = "wood"
    case stone = "stone"
}

enum ArmorType: String {
    case headArmor = "headArmor"
    case bodyArmor = "bodyArmor"
    case legArmor = "legArmor"
    case footArmor = "footArmor"
    case leftHandArmor = "leftHandArmor"
    case rightHandArmor = "rightHandArmor"
    case none = "none"
}

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

class BuildCost: NSObject, NSCoding {
    var wood: Int = 0
    var stone: Int = 0
    var diamond: Int = 0
    var emeralds: Int = 0
    var rubies: Int = 0
    var gold: Int = 0
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger(wood, forKey: "Cost-wood")
        aCoder.encodeInteger(stone, forKey: "Cost-stone")
        aCoder.encodeInteger(diamond, forKey: "Cost-diamond")
        aCoder.encodeInteger(emeralds, forKey: "Cost-emeralds")
        aCoder.encodeInteger(rubies, forKey: "Cost-rubies")
        aCoder.encodeInteger(gold, forKey: "Cost-gold")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.wood = aDecoder.decodeIntegerForKey("Cost-wood")
        self.stone = aDecoder.decodeIntegerForKey("Cost-stone")
        self.diamond = aDecoder.decodeIntegerForKey("Cost-diamond")
        self.emeralds = aDecoder.decodeIntegerForKey("Cost-emeralds")
        self.rubies = aDecoder.decodeIntegerForKey("Cost-rubies")
        self.gold = aDecoder.decodeIntegerForKey("Cost-gold")
    }
    
    init(wood: Int, stone: Int, diamond: Int, emeralds: Int, rubies: Int, gold: Int) {
        self.wood = wood
        self.stone = stone
        self.diamond = diamond
        self.emeralds = emeralds
        self.rubies = rubies
        self.gold = gold
    }
}

class InventoryItem: NSObject, NSCopying, NSCoding {
    
    var name: InventoryItemName?
    var imageName: String?
    var numberInStack = 0
    var cost = BuildCost(wood: 0, stone: 0, diamond: 0, emeralds: 0, rubies: 0, gold: 0)
    var itemType: InventoryItemType!
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name?.rawValue, forKey: "Item-name")
        aCoder.encodeObject(imageName, forKey: "Item-imageName")
        aCoder.encodeInteger(numberInStack, forKey: "Item-numberInStack")
        aCoder.encodeObject(cost, forKey: "Item-cost")
        aCoder.encodeObject(itemType.rawValue, forKey: "Item-itemType")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = InventoryItemName(rawValue: aDecoder.decodeObjectForKey("Item-name") as! String)
        self.imageName = aDecoder.decodeObjectForKey("Item-imageName") as? String
        self.numberInStack = aDecoder.decodeIntegerForKey("Item-numberInStack")
        self.cost = aDecoder.decodeObjectForKey("Item-cost") as! BuildCost
        self.itemType = InventoryItemType(rawValue: aDecoder.decodeObjectForKey("Item-itemType") as! String)
        
    }
    
    
    init(name: InventoryItemName, cost: BuildCost, itemType: InventoryItemType) {
        self.name = name
        self.imageName = name.rawValue
        self.cost = cost
        self.itemType = itemType
    }
    
    init(name: InventoryItemName, cost: BuildCost, numberInStack:Int, itemType: InventoryItemType) {
        self.name = name
        self.imageName = name.rawValue
        self.cost = cost
        self.numberInStack = numberInStack
        self.itemType = itemType
    }
    
    init(name: InventoryItemName) {
        self.name = name
        self.imageName = name.rawValue
        self.cost = BuildCost(wood: 0, stone: 0, diamond: 0, emeralds: 0, rubies: 0, gold: 0)
        self.itemType = InventoryItemType.other
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return InventoryItem(name: self.name!, cost: self.cost, numberInStack:self.numberInStack, itemType: self.itemType)
    }
}