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
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateEquippedSlots", name: "com.davidwnorman.updateEquippedSlots", object: nil)
        
        let squareWidth = CGFloat(50)
        let rows = EquippedSlotsConfig.numberOfRows
        let columns = EquippedSlotsConfig.numberOfColumns

        self.anchorPoint = CGPointMake(0.0,0.3)
        var overallCount = 0
        
        for var i = 0; i < columns; i++ {
            for var j = 0; j < rows; j++ {
                
                let inventoryItem = InventoryItemNode(rectOfSize: CGSize(width: squareWidth, height: squareWidth))
                inventoryItem.delegate = self
                let updatedX = CGFloat(squareWidth / 2) + CGFloat(i * 50) + CGFloat(1)
                let updatedY = CGFloat(self.frame.size.height - (CGFloat(inventoryItem.frame.size.height))) / CGFloat(2) - (squareWidth * CGFloat(j))
                
                inventoryItem.position = CGPoint(x:updatedX, y:updatedY )
                inventoryItem.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                inventoryItem.strokeColor = UIColor.whiteColor()
                inventoryItem.lineWidth = 2.0
                inventoryItem.number = overallCount
                overallCount++
                if i == 0 && j == 0 {
                    inventoryItem.selectItem()
                }
                self.addChild(inventoryItem)

            }
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
    
    func InventoryNodeTouched(item: InventoryItem?) {
            //Notify anything in your game what the selected weapon is
    }
    
    func updateEquippedSlots() {
        var inventoryItemsArray = [InventoryItem]()
        for item in GameState.sharedInstance.equippedItems {
            inventoryItemsArray.append(item)
        }

        var i = 0
        for invItemNode in self.children as! [InventoryItemNode] {
            if inventoryItemsArray.count > i {
                invItemNode.removeAllChildren()
                invItemNode.updateWithItem(inventoryItemsArray[i])
            } 
            i++
        }
    }
}
