//
//  InventoryViewController.swift
//  PestControl
//
//  Created by David Norman on 8/22/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import SpriteKit

class SecondaryInventoryViewController: UIViewController {
    
    var scene: SecondaryInventoryScene?
    @IBOutlet var inventoryMenuView: SKView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dismissMenu", name: "com.davidwnorman.dismissMainMenu", object: nil)
        
        self.scene = SecondaryInventoryScene(size: self.view.bounds.size)
        inventoryMenuView.showsFPS = true
        inventoryMenuView.showsNodeCount = true
        inventoryMenuView.ignoresSiblingOrder = true
        self.scene!.scaleMode = .ResizeFill
        inventoryMenuView.presentScene(scene)
        self.view.backgroundColor = UIColor.blackColor()
        
    }
    
    func dismissMenu() {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in })
    }
}
