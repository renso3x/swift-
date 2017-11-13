//: Playground - noun: a place where people can play

import UIKit

class Counter {
    
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
    
}

var counter = Counter()

counter.increment()

counter.increment(by: 10)

counter.reset()


struct Point {
    
    var x = 0.0, y = 0.0
    
    func isToRightof(x: Double) -> Bool {
        return self.x > x
    }
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    
}

let somePoint = Point (x: 4.0, y: 5.0)

if somePoint.isToRightof(x: 1.0) {
    print ("This point is to the irght of the line")
}

//constant of structure type cannot be mutated
let moveBy = Point(x: 3.0, y: 3.0)
//moveBy.moveBy(x: 30, y: 20)

enum TriStateSwitch {
    
    case off, low, high
    
    mutating func next() {
        
        switch self {
        case .off:
            self = .low
            
        case .low:
            self = .high
            
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low

ovenLight.next()

ovenLight.next()

// level tracking of player
struct LevelTracker {
    
    static var highestUnlockedLevel = 1
    
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
    
}

class Player {
    
    var tracker = LevelTracker()
    
    let playerName: String
    
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Romeo")

player.complete(level: 1)

print ("Highest unlocked level is now \(player.tracker.currentLevel)")


//another player
player = Player(name: "Bella")

if player.tracker.advance(to: 6) {
    print ("player is now on level 6")
} else {
    
    print ("level 6 is unlocked")
}



