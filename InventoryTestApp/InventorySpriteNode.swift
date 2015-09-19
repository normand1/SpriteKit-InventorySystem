    //
    //  InventorySpriteNode.swift
    //  Inventory
    //
    //  Created by David Norman on 8/15/15.
    //  Copyright (c) 2015 David Norman. All rights reserved.
    //
    
    import Foundation
    import SpriteKit
    
    extension Dictionary {
        mutating func map(transform: (key:Key, value:Value) -> (Value)) {
            for key in self.keys {
                let newValue = transform(key: key, value: self[key]!)
                self.updateValue(newValue, forKey: key)
            }
        }
    }
    
    protocol InventoryProtocol {
        func updateSlot(item: InventoryItem?, childIndex:Int)
        func selectedNode()->InventoryItemNode?
        var slotSelected: Bool {get set}
    }
    
    class InventorySpriteNode: SKSpriteNode, InventoryItemNodeProtocol {
        
        var delegate: InventoryProtocol?
        
        
        //MARK: - Lifecycle 
        
        init(size: CGSize) {
            super.init(texture:nil, color: UIColor.clearColor(), size: size)
        }
        
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        
        
        func showInventory() {
            var tempInvArray = [InventoryItem]()
            for key in GameState.sharedInstance.inventoryStorage {
                
                tempInvArray.append(key)
            }
            
            let columns = InventoryConfig.numberOfColumns
            let rows = InventoryConfig.numberOfRows
            let squareWidth = CGFloat(50)
            self.size = CGSizeMake(parent!.frame.size.width, CGFloat(rows) * squareWidth)
            self.anchorPoint = CGPointMake(0.5,0.5)
            self.position = CGPointMake(0, 0)
            self.color = UIColor.blackColor()
            
            var overallCount = 0
            
            for var i = 0; i < columns; i++ {
                for var j = 0; j < rows; j++ {
                    let inventoryItemNode = InventoryItemNode(rectOfSize: CGSize(width: squareWidth, height: squareWidth))
                    inventoryItemNode.delegate = self
                    let updatedX = self.frame.origin.x + (CGFloat(inventoryItemNode.frame.size.width) / CGFloat(2)) + squareWidth * CGFloat(i)
                    let updatedY = CGFloat(self.frame.size.height - (CGFloat(inventoryItemNode.frame.size.height))) / CGFloat(2) - (squareWidth * CGFloat(j))
                    inventoryItemNode.position = CGPoint(x:updatedX, y:updatedY )
                    inventoryItemNode.fillColor = UIColor.blackColor()
                    inventoryItemNode.strokeColor = UIColor.whiteColor()
                    inventoryItemNode.lineWidth = 2.0
                    inventoryItemNode.number = overallCount
                    overallCount++
                    
                    self.addChild(inventoryItemNode)
                    
                    if tempInvArray.count > 0 {
                        let item = tempInvArray.removeFirst()
                        inventoryItemNode.itemName = InventoryItemName(rawValue:item.imageName!)
                        inventoryItemNode.updateWithItem(item)
                        
                    }
                }
            }
        }
        
        func InventoryNodeTouched(item: InventoryItem?) {
            for node in self.children as! [InventoryItemNode] {
                //slot and inv node selected
                if node.selected && self.delegate?.selectedNode() != nil {
                    self.swapInvAndSlot(node)
                }
            }
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name:"com.davidwnorman.updateEquippedSlots", object: nil))
        }
        
        func swapInvAndSlot(selectedInvNode: InventoryItemNode) {
            let slot = self.delegate?.selectedNode()
            let tempSlotNode = slot!.copy() as! InventoryItemNode
            let tempInvNode = selectedInvNode.copy() as! InventoryItemNode
            self.updateInvetoryNode(tempSlotNode.item, childIndex: tempInvNode.number)
            self.delegate?.updateSlot(tempInvNode.item, childIndex: tempSlotNode.number)
            GameState.sharedInstance.inventoryStorage[tempInvNode.number] = tempSlotNode.item!
        }
        
        func updateInvetoryNode(item: InventoryItem?, childIndex:Int){
            (self.children[childIndex] as! InventoryItemNode).updateWithItem(item)
        }
        
        func resetAllNodesToDefault() {
            for node in self.children as [AnyObject] {
                if node.isKindOfClass(InventoryItemNode)
                {
                    (node as! InventoryItemNode).deselect()
                }
            }
        }
    
    }
