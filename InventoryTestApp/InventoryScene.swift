//
//  MenuInventoryScene.swift
//  PestControl
//
//  Created by David Norman on 8/18/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import SpriteKit
import UIKit

class InventoryScene: SKScene, InventoryItemNodeProtocol {
    
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateEquippedSlots", name: "com.davidwnorman.updateEquippedSlots", object: nil)
        
        
        let squareWidth = 50//view.bounds.size.width
        let rows = 3
        
        self.anchorPoint = CGPointMake(0.3
            ,0.85)
        
        for var i = 0; i < rows; i++ {
            let inventoryItem = InventoryItemNode(rectOfSize: CGSize(width: squareWidth, height: 50))
            inventoryItem.delegate = self
            let updatedX = CGFloat(squareWidth / 2)
            let updatedY = CGFloat(0 - (50 * CGFloat(i)))
            
            inventoryItem.position = CGPoint(x:updatedX, y:updatedY)
            inventoryItem.fillColor = UIColor.blackColor()
            inventoryItem.strokeColor = UIColor.whiteColor()
            inventoryItem.lineWidth = 2.0
            self.addChild(inventoryItem)
        }
        
        self.updateEquippedSlots()

    }
    
    func resetAllNodesToDefault() {
        for node in self.children as [AnyObject] {
            if node.isKindOfClass(InventoryItemNode)
            {
                (node as! InventoryItemNode).deselect()
            }
        }
    }
    
    func InventoryNodeTouched(itemName: String?) {
        if itemName != nil  {
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "com.davidwnorman.setSelectedItem", object: nil, userInfo: ["itemName":itemName!]))
        }
    }
    
    func updateEquippedSlots() {
        
        print("updateEquippedSlots")
//        var inventoryItemsArray = [InventoryItem]()
//        
//        for item in GameState.sharedInstance.equippedItems {
//            inventoryItemsArray.append(item.1)
//        }
//
//        var i = 0
//        for invItemNode in self.children as! [InventoryItemNode] {
//            if inventoryItemsArray.count > i {
//                invItemNode.removeAllChildren()
//                invItemNode.updateWithItem(inventoryItemsArray[i])
//            } else {
//                invItemNode.removeAllChildren()
//                invItemNode.updateWithItem(nil)
//            }
//            i++
//        }
    }
}
