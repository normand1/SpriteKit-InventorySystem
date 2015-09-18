//
//  ViewController.swift
//  InventoryTestApp
//
//  Created by David Norman on 9/17/15.
//  Copyright © 2015 David Norman. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //fill every inventory node with something and see how that works! also be sure to fill the slots too
        
        let empty = InventoryItem(name: InventoryItemName.empty, numberInStack: 0, itemType: InventoryItemType.other)
        
        GameState.sharedInstance.equippedItems.append(empty)
        GameState.sharedInstance.equippedItems.append(empty)
        GameState.sharedInstance.equippedItems.append(empty)
        GameState.sharedInstance.equippedItems.append(empty)
        GameState.sharedInstance.equippedItems.append(empty)
        GameState.sharedInstance.equippedItems.append(empty)
        GameState.sharedInstance.equippedItems.append(empty)
        GameState.sharedInstance.equippedItems.append(empty)
        GameState.sharedInstance.equippedItems.append(empty)
        
            let flail_bronze = InventoryItem(name:InventoryItemName.flail_bronze,numberInStack: 1,  itemType: InventoryItemType.other)
            let hammer_gold = InventoryItem(name:InventoryItemName.hammer_gold,numberInStack: 1,  itemType: InventoryItemType.other)
            let pick_silver = InventoryItem(name:InventoryItemName.pick_silver, numberInStack: 1, itemType: InventoryItemType.other)
            let stew = InventoryItem(name:InventoryItemName.stew, numberInStack: 1,  itemType: InventoryItemType.other)
            let sword_gold = InventoryItem(name:InventoryItemName.sword_gold,numberInStack: 1, itemType: InventoryItemType.other)
            let sword_silver = InventoryItem(name:InventoryItemName.sword_silver,numberInStack: 1,  itemType: InventoryItemType.other)
            let rubies = InventoryItem(name:InventoryItemName.ore_ruby, numberInStack: 1, itemType: InventoryItemType.other)
        
        
            GameState.sharedInstance.inventoryStorage.append(flail_bronze)
            GameState.sharedInstance.inventoryStorage.append(hammer_gold)
            GameState.sharedInstance.inventoryStorage.append(pick_silver)
            GameState.sharedInstance.inventoryStorage.append(stew)
            GameState.sharedInstance.inventoryStorage.append(sword_gold)
            GameState.sharedInstance.inventoryStorage.append(sword_silver)
            GameState.sharedInstance.inventoryStorage.append(rubies)
            for var i = 0; i < 40; i++ {
                GameState.sharedInstance.inventoryStorage.append(empty)
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

