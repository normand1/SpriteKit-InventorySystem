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
        
        
            let flail_bronze = InventoryItem(name:InventoryItemName.flail_bronze, cost: BuildCost(wood: 0, stone: 0, diamond: 0, emeralds: 3, rubies: 0, gold:0), itemType: InventoryItemType.other)
            let hammer_gold = InventoryItem(name:InventoryItemName.hammer_gold, cost: BuildCost(wood: 0, stone: 0, diamond: 3, emeralds: 0, rubies: 3, gold:0), itemType: InventoryItemType.other)
            let pick_silver = InventoryItem(name:InventoryItemName.pick_silver, cost: BuildCost(wood: 0, stone: 0, diamond: 3, emeralds: 0, rubies: 0, gold:0), itemType: InventoryItemType.other)
            let stew = InventoryItem(name:InventoryItemName.stew, cost: BuildCost(wood: 0, stone: 0, diamond: 3, emeralds: 0, rubies: 0, gold:0), itemType: InventoryItemType.other)
            let sword_gold = InventoryItem(name:InventoryItemName.sword_gold, cost: BuildCost(wood: 0, stone: 0, diamond: 3, emeralds: 0, rubies: 0, gold:0), itemType: InventoryItemType.other)
            let sword_silver = InventoryItem(name:InventoryItemName.sword_silver, cost: BuildCost(wood: 0, stone: 0, diamond: 3, emeralds: 0, rubies: 0, gold:0), itemType: InventoryItemType.other)
            let rubies = InventoryItem(name:InventoryItemName.ore_ruby, cost: BuildCost(wood: 0, stone: 0, diamond: 0, emeralds: 0, rubies: 1, gold:0), itemType: InventoryItemType.other)
        
        
            GameState.sharedInstance.inventoryStorage[flail_bronze.imageName!] = flail_bronze
            GameState.sharedInstance.inventoryStorage[hammer_gold.imageName!] = hammer_gold
            GameState.sharedInstance.inventoryStorage[pick_silver.imageName!] = pick_silver
            GameState.sharedInstance.inventoryStorage[stew.imageName!] = stew
            GameState.sharedInstance.inventoryStorage[sword_gold.imageName!] = sword_gold
            GameState.sharedInstance.inventoryStorage[sword_silver.imageName!] = sword_silver
            GameState.sharedInstance.inventoryStorage[rubies.imageName!] = rubies            

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

