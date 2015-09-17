//
//  SlotsSpriteNode.swift
//  Inventory
//
//  Created by David Norman on 8/16/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import SpriteKit
import Foundation



class SlotsSpriteNode: SKSpriteNode,InventoryItemNodeProtocol, InventoryProtocol {
    
    var slotSelected: Bool
    
    init(size: CGSize) {
        slotSelected = false
        super.init(texture:nil, color: UIColor.clearColor(), size: size)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showInventory() {
        
        let squareWidth = CGFloat(50) //parent!.frame.size.width / CGFloat(columns)
        let rows = 3 //Int(parent!.frame.size.height / squareWidth)

        self.size = CGSizeMake(squareWidth, CGFloat(rows) * squareWidth)
        self.anchorPoint = CGPointMake(0.0,0.5)
        self.position = CGPointMake(self.parent!.frame.width / 2 - squareWidth, 0)
        self.color = UIColor.yellowColor()
        
        for var i = 0; i < rows; i++ {
                
                let inventoryItem = InventoryItemNode(rectOfSize: CGSize(width: squareWidth, height: squareWidth))
                inventoryItem.delegate = self
                let updatedX = CGFloat(squareWidth / 2)
                let updatedY = CGFloat(self.frame.size.height - (CGFloat(inventoryItem.frame.size.height))) / CGFloat(2) - (squareWidth * CGFloat(i))
                
                inventoryItem.position = CGPoint(x:updatedX, y:updatedY )
                inventoryItem.fillColor = UIColor.blackColor()
                inventoryItem.strokeColor = UIColor.whiteColor()
                inventoryItem.lineWidth = 2.0
            if i == 0 {
                inventoryItem.selectItem()
            }
                self.addChild(inventoryItem)
        }
        
        updateSlotsWithEquippedItems()
    }
    
    func selectedNode()->InventoryItemNode? {
        for node in self.children as [AnyObject] {
            if node.isKindOfClass(InventoryItemNode)
            {
                if (node as! InventoryItemNode).selected {
                    slotSelected = true
                    return node as? InventoryItemNode
                }
            }
        }
        
        return nil
    }
    
    func InventoryNodeTouched(itemName: String?) {
    }
    
    func resetAllNodesToDefault() {
        for node in self.children as [AnyObject] {
            if node.isKindOfClass(InventoryItemNode) {
                (node as! InventoryItemNode).deselect()
            }
        }
    }
    
    func updateSlot(item: InventoryItem?)->InventoryItem? {
        return nil
    }
    
    class func addNewItemNamed(name: InventoryItemName) {
        if GameState.sharedInstance.equippedItems[name.rawValue] != nil {
            GameState.sharedInstance.equippedItems[name.rawValue]?.numberInStack++
        } else {
            GameState.sharedInstance.equippedItems[name.rawValue] = InventoryItem(name: name)
            GameState.sharedInstance.equippedItems[name.rawValue]?.numberInStack = 1
        }
    }
    
    func listItemsInSlots()->[InventoryItemNode] {
        return self.children as! [InventoryItemNode]
    }
    
    func updateSlotsWithEquippedItems() {
        var i = 0
        for (key, _) in GameState.sharedInstance.equippedItems {
            if let equippedItem = GameState.sharedInstance.equippedItems[key] {
                (self.children[i] as! InventoryItemNode).updateWithItem(equippedItem)
            }
            i++
        }
        
    }
    
    

}
