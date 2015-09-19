//
//  ViewController.swift
//  InventoryTestApp
//
//  Created by David Norman on 9/17/15.
//  Copyright © 2015 David Norman. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    var scene: InventoryScene?
    @IBOutlet weak var inventoryMenuView: SKView!

    //MARK: - Lifecycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure the game state for this demo!
        GameState.inititialSetup()

        //setup view
        self.view.backgroundColor = UIColor.blackColor()

        //setup scene
        self.scene = InventoryScene(size: self.view.bounds.size)
        inventoryMenuView.showsFPS = true
        inventoryMenuView.showsNodeCount = true
        inventoryMenuView.ignoresSiblingOrder = true
        self.scene!.scaleMode = .ResizeFill
        inventoryMenuView.presentScene(scene)
        
    }

    
    @IBAction func addSword(sender: AnyObject) {
     let foundItem = GameState.findInventoryItemInEitherStorage(InventoryItemName.sword_silver)
        foundItem?.numberInStack++
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name:"com.davidwnorman.updateEquippedSlots", object: nil))
    }
    
}

