//: Playground - noun: a place where people can play

import UIKit

class Person {
    
    var residence: Residence? // optional value nil
}

class Residence {
    
    var rooms = [Room]() //array of type room
    
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        
        get {
            return rooms[i]
        }
        
        set {
            rooms[i] = newValue
        }
        
    }
    
    func printNumberOfRooms() {
        print ("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
}

class Room {
    let name: String
    init (name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    
    var buildingNumber: String?
    
    var street: String?
    
    
    func buildingIdentifier() -> String? {
        
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let john = Person()

//assign residence instance to john.residence, no longer a nil
john.residence = Residence()

//access optional by ?
if let roomCount = john.residence?.numberOfRooms {
    print ("John has \(roomCount) rooms(s)")
} else {
    print ("Unable to retrieve the number rooms")
}

let someAddress = Address()

someAddress.buildingNumber = "29"

someAddress.street = "Capitol"

john.residence?.address = someAddress

//assign to john's residence
let johnHouse = Residence()

johnHouse.rooms.append(Room(name: "Living Room"))

johnHouse.rooms.append(Room(name: "Kitchen"))

john.residence = johnHouse

if let firstRoomName = john.residence?[0].name {
    print ("The first room name is \(firstRoomName)")
} else {
    print ("No records found.")
}


// multiple level of linking
let johnAddress = Address()
johnAddress.buildingName = "The Larches"
johnAddress.street = "Laurel Street"
john.residence?.address = johnAddress

if let johnStreet = john.residence?.address?.street{
    print ("John's street name is \(johnStreet)")
} else {
    print ("Unable to retrive address")
}

if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print ("John's building identifier is \(buildingIdentifier)")
}



