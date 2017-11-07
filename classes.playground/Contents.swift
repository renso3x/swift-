//: Playground - noun: a place where people can play

import UIKit

struct Resolution {
    var width = 0
    
    var height = 0
}

class VideoMode {
    
    var resolution = Resolution()
    
    var interlaced = false
    
    var frameRate = 0.0
    
    var name: String?
    
}

//creating instance of class or struct

let someResolution = Resolution()

let someVideoMode = VideoMode()

print ("The width of someResolution is \(someResolution.width)")

someVideoMode.resolution.width = 200

print ("The width of someResolution is \(someVideoMode.resolution.width)")

//stucture has automatic initializers

let vga = Resolution (width: 640, height: 480)

let hd = Resolution(width: 1920, height: 1080)

//assign a copy of the struct
var cinema = hd

//hd.width is not affected
cinema.width = 2048

print ("cinema is now \(cinema.width) pixels wide")

print ("hd is now \(hd.width) pixels wide")


enum CompassPoint {
    case north, south, east, west
}

var currentDirection = CompassPoint.west

let rememberdDirection = currentDirection

if rememberdDirection == .west {
    print ("The remembered direction is still .west")
}

let tenEighty = VideoMode()

tenEighty.resolution = hd

tenEighty.interlaced = true

tenEighty.name = "1080i"

tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty

// refers to the same class instance so changes will apply to all assigned values.
alsoTenEighty.frameRate = 30.0

print ("The frame rate property is \(tenEighty.frameRate)")

// === for identity operator

if alsoTenEighty === tenEighty {
    print ("They are the same.")
}




