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
        func updateSlot(item: InventoryItem?)->InventoryItem?
        func selectedNode()->InventoryItemNode?
        var slotSelected: Bool {get set}
    }
    
    class InventorySpriteNode: SKSpriteNode, InventoryItemNodeProtocol {
        
        var delegate: InventoryProtocol?
        
        init(size: CGSize) {
            super.init(texture:nil, color: UIColor.clearColor(), size: size)
        }
        
        func showInventory() {
            var tempInvArray = [InventoryItem]()
            for key in GameState.sharedInstance.inventoryStorage.keys {
                
                tempInvArray.append(GameState.sharedInstance.inventoryStorage[key]!)
            }
            
            let columns = 8 //change number of columns (rows are auto-calced based on size of view)
            
            let squareWidth = CGFloat(50) //parent!.frame.size.width / CGFloat(columns)
            let rows = 5 //Int(parent!.frame.size.height / squareWidth)
            self.size = CGSizeMake(parent!.frame.size.width, CGFloat(rows) * squareWidth)
            self.anchorPoint = CGPointMake(0.5,0.5)
            self.position = CGPointMake(0, 0)
            self.color = UIColor.blackColor()
            
            for var i = 0; i < columns; i++ {
                for var j = 0; j < rows; j++ {
                    let inventoryItem = InventoryItemNode(rectOfSize: CGSize(width: squareWidth, height: squareWidth))
                    inventoryItem.delegate = self
                    let updatedX = self.frame.origin.x + (CGFloat(inventoryItem.frame.size.width) / CGFloat(2)) + squareWidth * CGFloat(i)
                    let updatedY = CGFloat(self.frame.size.height - (CGFloat(inventoryItem.frame.size.height))) / CGFloat(2) - (squareWidth * CGFloat(j))
                    inventoryItem.position = CGPoint(x:updatedX, y:updatedY )
                    inventoryItem.fillColor = UIColor.blackColor()
                    inventoryItem.strokeColor = UIColor.whiteColor()
                    inventoryItem.lineWidth = 2.0
                    
                    
                    self.addChild(inventoryItem)
                    
                    if tempInvArray.count > 0 {
                        let item = tempInvArray.removeLast()
                        inventoryItem.itemName = InventoryItemName(rawValue:item.imageName!)
                        inventoryItem.updateWithItem(item)
                        
                    }
                }
            }
        }
        
        class func addNewItemNamed(name: InventoryItemName) {
            if GameState.sharedInstance.inventoryStorage[name.rawValue] != nil {
                GameState.sharedInstance.inventoryStorage[name.rawValue]?.numberInStack++
            }
            else {
                GameState.sharedInstance.inventoryStorage[name.rawValue] = InventoryItem(name: name)
                GameState.sharedInstance.inventoryStorage[name.rawValue]?.numberInStack = 1
            }
        }
        
        func InventoryNodeTouched(itemName: String?) {
            for node in self.children as! [InventoryItemNode] {
                //slot and inv node selected
                if node.selected && self.delegate?.selectedNode() != nil {
                    self.swapInvAndSlot(node)
                }
            }
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "com.davidwnorman.updateEquippedSlots", object: nil))
        }
        
        func swapInvAndSlot(selectedInv: InventoryItemNode) {
            let slot = self.delegate?.selectedNode()
            
            if selectedInv.itemName != nil {
                let tempInvItem = GameState.sharedInstance.inventoryStorage[(selectedInv.itemName?.rawValue)!]
                
                GameState.sharedInstance.inventoryStorage[(selectedInv.itemName?.rawValue)!] = nil
                if slot?.itemName != nil {
                    print(GameState.sharedInstance.equippedItems[(slot?.itemName?.rawValue)!])
                    GameState.sharedInstance.inventoryStorage[(slot?.itemName?.rawValue)!] = GameState.sharedInstance.equippedItems[(slot?.itemName?.rawValue)!]
                    GameState.sharedInstance.equippedItems[(slot?.itemName?.rawValue)!] = nil
                } else {
                    GameState.sharedInstance.inventoryStorage[(selectedInv.itemName?.rawValue)!] = nil
                }
                GameState.sharedInstance.equippedItems[(tempInvItem?.name?.rawValue)!] = tempInvItem
                
                if slot?.itemName != nil {
                    selectedInv.updateWithItem(GameState.sharedInstance.inventoryStorage[(slot?.itemName?.rawValue)!])
                } else {
                    selectedInv.updateWithItem(nil)
                }
                
                if tempInvItem?.name != nil {
                    slot?.updateWithItem(GameState.sharedInstance.equippedItems[(tempInvItem?.name?.rawValue)!])
                } else {
                    slot?.updateWithItem(nil)
                }
            } else {
                if slot?.itemName != nil {
                    GameState.sharedInstance.inventoryStorage[(slot?.itemName?.rawValue)!] = GameState.sharedInstance.equippedItems[(slot?.itemName?.rawValue)!]
                    GameState.sharedInstance.equippedItems[(slot?.itemName?.rawValue)!] = nil
                    selectedInv.updateWithItem(GameState.sharedInstance.inventoryStorage[(slot?.itemName?.rawValue)!])
                    slot?.updateWithItem(nil)
                }
            }
        }
        
        func resetAllNodesToDefault() {
            for node in self.children as [AnyObject] {
                if node.isKindOfClass(InventoryItemNode)
                {
                    (node as! InventoryItemNode).deselect()
                }
            }
        }
        
        
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
