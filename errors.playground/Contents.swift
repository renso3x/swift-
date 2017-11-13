//: Playground - noun: a place where people can play

import UIKit


enum VendingMachineError: Error {
    
    case invalidSelection
    
    case insufficientFunds(coinsNeeded: Int)
    
    case outOfStock
    
}

struct Item {
    
    var price: Int
    
    var count: Int
    
}

class VendingMachine {
    
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    
    func vend(itemNamed name: String) throws {
        
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        
        newItem.count -= 1
        
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favouriteSnack = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels"
]

func buyFavSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favouriteSnack[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}
// throws initializer error
struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

var vendingMachine = VendingMachine()

vendingMachine.coinsDeposited = 8

do {
    
    try buyFavSnack(person: "Alice", vendingMachine: vendingMachine)
    
} catch VendingMachineError.invalidSelection {
    
    print ("Invalid Selection")
    
} catch VendingMachineError.outOfStock {
    
    print ("Out of stock")
    
} catch VendingMachineError.insufficientFunds(let coinsNedded) {
    
    print ("Insufficient funds. Please insert an additional \(coinsNedded) coins.")
    
}








