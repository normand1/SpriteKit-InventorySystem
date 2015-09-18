//
//  GameState.swift
//  PestControl
//
//  Created by David Norman on 8/5/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import Foundation

extension Dictionary {
    init(_ pairs: [Element]) {
        self.init()
        for (k, v) in pairs {
            self[k] = v
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
    
    let totalLevels = 5
    
    
    
//    class func findInventoryItemInEitherStorage(inventoryItemName: InventoryItemName)->InventoryItem? {
//      
//        if GameState.sharedInstance.inventoryStorage[inventoryItemName.rawValue] != nil {
//            return GameState.sharedInstance.inventoryStorage[inventoryItemName.rawValue]
//        } else {
//        if GameState.sharedInstance.equippedItems[inventoryItemName.rawValue] != nil {
//                return GameState.sharedInstance.equippedItems[inventoryItemName.rawValue]
//            }
//        }
//        
//        return nil
//    }
//    
//    class func findInventoryItemInEitherTemporaryCloneStorage(inventoryItemName:InventoryItemName)->InventoryItem? {
//        
//        if GameState.sharedInstance.inventoryStorageTempClone[inventoryItemName] != nil {
//            return GameState.sharedInstance.inventoryStorageTempClone[inventoryItemName]
//        } else {
//            if GameState.sharedInstance.equippedItemsTempClone[inventoryItemName] != nil {
//                return GameState.sharedInstance.equippedItemsTempClone[inventoryItemName]
//            }
//        }
//        
//        return nil
//    }
    
//    class func itemFromInventoryStorageWithName(name:String)->InventoryItem? {
//        
////        return GameState.sharedInstance.inventoryStorage[name]
//        
//    }
    
}