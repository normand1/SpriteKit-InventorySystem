# SpriteKit-InventorySystem
### TL;DR
A Simple inventory System for your SpriteKit game

### Description
I developed this while working on my latest sprite kit game. I thought it might be useful to others as well. I plan on updating this project as I continue to develop by own game using this inventory system. Features will mostly emerge organically based on my own needs, but I welcome pull-requests based on needs you discover.

### Features

#### Add Items to equipment slots
InventorySystem assumes you'll use a seperate ViewController for your inventory view. Simply push to the SecondaryInventoryViewController which will display the SecondaryInventoryScene. From this view you will see your inventory items on the left and your equipment slots on the right. Simply selecting an inventory item will move it to the highlighted equipment slot. Items added to the equipment slots will be available on the GameViewController.
![Moving an item from inventory to a player equipment slot](https://github.com/normand1/SpriteKit-InventorySystem/blob/master/InventoryTestApp/inventoryExample1.gif)

#### Increment item counts easily
Easily change the number of items in the inventory
```
let foundItem = GameState.findInventoryItemInEitherStorage(InventoryItemName.sword_silver)
foundItem?.numberInStack++
```
![Adding an additional item](https://github.com/normand1/SpriteKit-InventorySystem/blob/master/InventoryTestApp/inventoryExample2.gif)

### Inventory and Equipped Items Storage
This example app uses a singleton GameState object to maintain equipped and unequipped inventory arrays, but feel free to use your own solution.

### Caching
InventoryItem conforms to NSCoding. Cache it any way you'd like and initialize the inventoryStorage or equippeditems arrays prior to showing the inventory.

### Easy Customization
Adjust the number of rows or columns in either the inventory or the Equipment Slots easily by adjusting these static constants

```
class InventoryConfig {
   static let numberOfRows = 5
   static let numberOfColumns = 8
    static var totalInventoryNodes : Int {
        get {
        return numberOfColumns * numberOfRows
        }
    }
}

class EquippedSlotsConfig {
    static let numberOfRows = 3
    static let numberOfColumns = 1
    static var totalInventoryNodes : Int {
        get {
            return numberOfColumns * numberOfRows
        }
    }
}
```

### Setup

1. Make sure to call this somewhere during the app's initialization (unless using your own GameState solution):
```
        GameState.inititialSetup()
```
2. Present the InventoryScene wherever you want the player to have access to their equipped items (usually somewhere on the main game play scene)
3. Present SecondaryInventoryViewController whenever you want the player to move items back and forth between their inventory and equipped item slots

###
Planned Features
* Drag and drop
* Scrolling Inventory

### Credit
Thanks to the 'Asset Jesus' Kenney for his awesome item images available for free here:
http://www.kenney.nl/assets/voxel-pack

### License
The MIT License (MIT)
