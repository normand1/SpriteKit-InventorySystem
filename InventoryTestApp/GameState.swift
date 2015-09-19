//
//  GameState.swift
//  PestControl
//
//  Created by David Norman on 8/5/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import Foundation

class InventoryConfig {
   static let numberOfRows = 5
   static let numberOfColumns = 8
    static var totalInventoryNodes : Int {
        get {
        return numberOfColumns * numberOfRows
        }
    }
}

class EquippedSlotsConfig {
    static let numberOfRows = 3
    static let numberOfColumns = 1
    static var totalInventoryNodes : Int {
        get {
            return numberOfColumns * numberOfRows
        }
    }
}

class GameState {
    
    static let sharedInstance = GameState()
    var inventoryStorage = [InventoryItem]()
    var equippedItems = [InventoryItem]()
    var gameTimer : NSTimer?
    var inventoryStorageTempClone = [InventoryItemName : InventoryItem]()
    var equippedItemsTempClone = [InventoryItemName : InventoryItem]()
    var equippedArmor = [String : InventoryItem]()
    var selectedWeapon: InventoryItem?
    
    let totalLevels = 5
    
    
    
    class func findInventoryItemInEitherStorage(inventoryItemName: InventoryItemName)->InventoryItem? {
        
        if let indexOfItem = GameState.sharedInstance.inventoryStorage.map({ $0.name!.rawValue }).indexOf(inventoryItemName.rawValue) {
            return GameState.sharedInstance.inventoryStorage[indexOfItem]
        }
        else {
            if let indexOfItem = GameState.sharedInstance.equippedItems.map({ $0.name!.rawValue }).indexOf(inventoryItemName.rawValue) {
                return GameState.sharedInstance.equippedItems[indexOfItem]
            }
        }
        return nil
    }
    
    class func inititialSetup() {
        //add new inventory items
        let empty = InventoryItem(name: InventoryItemName.empty, numberInStack: 0)
        
        for var i = 0; i < EquippedSlotsConfig.totalInventoryNodes ; i++ {
            GameState.sharedInstance.equippedItems.append(empty)
            
        }
        
        let flail_bronze = InventoryItem(name:InventoryItemName.flail_bronze,numberInStack: 1)
        let hammer_gold = InventoryItem(name:InventoryItemName.hammer_gold,numberInStack: 1)
        let pick_silver = InventoryItem(name:InventoryItemName.pick_silver, numberInStack: 1)
        let stew = InventoryItem(name:InventoryItemName.stew, numberInStack: 1)
        let sword_silver = InventoryItem(name:InventoryItemName.sword_silver,numberInStack: 1)
        let rubies = InventoryItem(name:InventoryItemName.ore_ruby, numberInStack: 1)
        
        GameState.sharedInstance.inventoryStorage.append(flail_bronze)
        GameState.sharedInstance.inventoryStorage.append(hammer_gold)
        GameState.sharedInstance.inventoryStorage.append(pick_silver)
        GameState.sharedInstance.inventoryStorage.append(stew)
        GameState.sharedInstance.inventoryStorage.append(sword_silver)
        GameState.sharedInstance.inventoryStorage.append(rubies)
        for var i = 0; i < 40; i++ {
            GameState.sharedInstance.inventoryStorage.append(empty)
        }

    }
    
}