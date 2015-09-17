//
//  InventoryViewController.swift
//  PestControl
//
//  Created by David Norman on 8/22/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import SpriteKit

class InventoryViewController: UIViewController {
    
    var scene: SecondaryInventoryScene?
    @IBOutlet var inventoryMenuView: SKView!
    
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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
