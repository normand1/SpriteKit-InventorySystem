//
//  MenuButton.swift
//  Inventory
//
//  Created by David Norman on 8/17/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import SpriteKit

protocol MenuButtonDelegate {
    func menuButtonTouched()
}

class MenuButton: SKSpriteNode {
    
    var delegate: MenuButtonDelegate?
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture:nil, color: UIColor.clearColor(), size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("update slots")
        delegate!.menuButtonTouched()
    }
}
