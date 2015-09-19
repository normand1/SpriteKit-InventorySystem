//
//  TouchableShapeNode.swift
//  Inventory
//
//  Created by David Norman on 8/16/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import SpriteKit

protocol InventoryItemNodeProtocol {
    func InventoryNodeTouched(item:InventoryItem?)
    func resetAllNodesToDefault()
}

var INV_COLOR_SELECTED = UIColor.blueColor()
var INV_COLOR_DESELECTED = UIColor.blackColor()

class InventoryItemNode: SKShapeNode {
    
    var delegate : InventoryItemNodeProtocol?
    var itemName : InventoryItemName?
    var selected = false
    var imageNode : SKSpriteNode?
    var backgroundImage: SKSpriteNode?
    var number = 0
    var item : InventoryItem?
    
    override init() {
        super.init()
        self.userInteractionEnabled = true
    }
    
    func updateWithItem(item: InventoryItem?) {
        self.removeAllChildren()
        if let realItem = item {
            self.item = item
            self.itemName = InventoryItemName(rawValue: realItem.imageName!)
            imageNode = SKSpriteNode(imageNamed: realItem.imageName!)
            imageNode?.size = CGSizeMake(35, 35)
            self.addChild(imageNode!)
            
            let countLabel = SKLabelNode(text: realItem.numberInStack == 0 ? "" : String(realItem.numberInStack))
            countLabel.fontSize = 20
            countLabel.position = CGPointMake(-15, 5)
            countLabel.fontColor = UIColor.whiteColor()
            countLabel.fontName = "AmericanTypewriter-Bold"
            countLabel.zPosition = 10
            self.addChild(countLabel)
            updateWithBackgroundImageNode()
        } else {
            self.imageNode = SKSpriteNode(imageNamed: "")
            updateWithBackgroundImageNode()
        }

    }
    
    func addImageOnly(item: InventoryItem?) {
        if let realItem = item {
            self.itemName = InventoryItemName(rawValue: realItem.imageName!)
            imageNode = SKSpriteNode(imageNamed: realItem.imageName!)
            self.addChild(imageNode!)
            imageNode!.size = CGSizeMake(35, 35)
        }
    }
    
    func updateWithBackgroundImageNode() {
        if self.backgroundImage != nil {
            self.addChild(backgroundImage!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        delegate?.resetAllNodesToDefault()
        self.selectItem()
        delegate?.InventoryNodeTouched(self.item)

    }
    
    func selectItem() {
        self.fillColor = INV_COLOR_SELECTED
        self.selected = true
        print("selected: \(self.itemName)")

    }
    
    func deselect() {
        self.fillColor = INV_COLOR_DESELECTED
        self.selected = false
    }
    
    override func copyWithZone(zone: NSZone) -> AnyObject {
        let invItemNodeCopy = InventoryItemNode()
        invItemNodeCopy.delegate = delegate
        invItemNodeCopy.itemName = itemName
        invItemNodeCopy.selected = selected
        invItemNodeCopy.imageNode = imageNode
        invItemNodeCopy.backgroundImage = backgroundImage
        invItemNodeCopy.number = number
        invItemNodeCopy.item = item
        return invItemNodeCopy
    }

    
}
