//
//  SecondaryInventoryScene.swift
//  PestControl
//
//  Created by David Norman on 8/22/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import SpriteKit

class SecondaryInventoryScene: SKScene, MenuButtonDelegate {
    
    var inventorySpriteNode: InventorySpriteNode?
    var slotsSpriteNode: SlotsSpriteNode?
    
    override func didMoveToView(view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        inventorySpriteNode = InventorySpriteNode(size: CGSizeMake(0, 0))
        self.addChild(inventorySpriteNode!)
        inventorySpriteNode!.showInventory()
        
        slotsSpriteNode = SlotsSpriteNode(size: CGSizeMake(0, 0))
        self.addChild(slotsSpriteNode!)
        slotsSpriteNode!.showInventory()
        
        inventorySpriteNode!.delegate = slotsSpriteNode
        
        let updateButton = MenuButton(color: UIColor.blackColor(), size: CGSizeMake(25, 25))
        updateButton.name = "updateSlotsButton"
        updateButton.texture = SKTexture(image: UIImage(named: "closeButton")!)
        updateButton.color = UIColor.blackColor()
        updateButton.position = CGPointMake(self.size.width / 2 - updateButton.size.width, 140)
        updateButton.delegate = self
        updateButton.userInteractionEnabled = true
        self.addChild(updateButton)
        print("\(self.slotsSpriteNode?.listItemsInSlots())")
    }
    
    func menuButtonTouched() {
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "com.davidwnorman.dismissMainMenu", object: nil))
    }
   
}
