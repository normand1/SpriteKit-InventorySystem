//
//  TouchableShapeNode.swift
//  Inventory
//
//  Created by David Norman on 8/16/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import SpriteKit

protocol InventoryItemNodeProtocol {
    func InventoryNodeTouched(itemName:String?)
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
    
    override init() {
        super.init()
        self.userInteractionEnabled = true
    }
    
    func updateWithItem(item: InventoryItem?) {
        self.removeAllChildren()
        if let realItem = item {
            self.itemName = InventoryItemName(rawValue: realItem.imageName!)
            imageNode = SKSpriteNode(imageNamed: realItem.imageName!)
            imageNode?.size = CGSizeMake(35, 35)
            self.addChild(imageNode!)
            
            let countLabel = SKLabelNode(text: String(realItem.numberInStack))
            countLabel.fontSize = 20
            countLabel.position = CGPointMake(-15, 5)
            countLabel.fontColor = UIColor.whiteColor()
            countLabel.fontName = "AmericanTypewriter-Bold"
            countLabel.zPosition = 10
            self.addChild(countLabel)
            updateWithBackgroundImageNode()
        } else {
            self.itemName = nil
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
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        delegate?.resetAllNodesToDefault()
        self.selectItem()
        delegate?.InventoryNodeTouched(self.itemName?.rawValue)

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
    
}
