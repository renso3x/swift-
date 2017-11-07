//: Playground - noun: a place where people can play

import UIKit

struct FixedLengthRange {
    
    var firstValue: Int
    
    let length: Int
    
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6


// constant variable on strucute cannot be mutated

//let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)

//rangeOfFourItems.firstValue = 6


class DataImporter {
    
    var filename = "data.txt"
}

class DataManager {
    //lazy variables
    // it will be initialized if it access first time.
    lazy var importer = DataImporter()
    
    var data = [String]()
    
}

let manager = DataManager()

manager.data.append("Some data")

manager.data.append("Some more data")

//not yet initialized
print (manager.importer)
// now initialized when called
print (manager.importer.filename)


//calculated properties
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    
    var origin = Point()
    
    var size = Size()
    
    //getter, setter
    var center: Point {
        
        get {
            
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
            
        }
        
        set(newCenter) {
            //newCenter is param name
            // if no param name newValue is defined as a default
            
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
            
        }
        
    }
    
}

var square = Rect(
    origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0)
)
let initialSquareCenter = square.center

square.center = Point(x: 15.0, y: 15.0)

print ("square.origin is now at (\(square.origin.x), \(square.origin.y))")

struct Cubiod {
    
    var width = 0.0, height = 0.0, depth = 0.0
    
    var volume: Double {
        //read only properties must return a value
        //cannot have another different value
        return width * height * depth
        
    }
    
}

let fourByFiveByTwo = Cubiod(width: 4.0, height: 5.0, depth: 2.0)

print ("the voluyme of fourByFiveByTwo is \(fourByFiveByTwo.volume)")


///willSet and didSet observers
//are always called

class StepCounter {
    
    var totalSteps: Int = 0 {
        
        willSet(newTotalSteps) {
            //will be called
            print ("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            //track the oldvalue
            if totalSteps > oldValue {
                print ("Added \(totalSteps - oldValue) steps")
            }
        }
        
    }
}

let stepCounter = StepCounter()

stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 896


//setting type properties
// static

struct AudioChannel {
    
    static let thresholdLevel = 10
    
    static var maxInputLevelForAllCHannels = 0
    
    var currentLevel: Int = 0 {
        
        didSet {
    
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllCHannels {
                AudioChannel.maxInputLevelForAllCHannels = currentLevel
            }
        }
        
    }
    
}

var leftChannel = AudioChannel()

var rightChannel = AudioChannel()

leftChannel.currentLevel = 7

print (leftChannel.currentLevel)

print (AudioChannel.maxInputLevelForAllCHannels)

rightChannel.currentLevel = 11

print (rightChannel.currentLevel)

print (AudioChannel.maxInputLevelForAllCHannels)



