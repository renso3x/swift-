//: Playground - noun: a place where people can play

import UIKit

//enum starts at 0
enum Rank: Int {
    
    case ace = 1
    case two, three
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
            
        case .ace:
            return "ace"
            
        case .jack:
            return "jack"
            
        case .queen:
            return "queen"
            
        case .king:
            return "king"
            
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.king
let aceRawValue = ace.rawValue

//change the init value of enum
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
            
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .clubs:
            return "black"
        case .spades:
            return "black"
        case .diamonds:
            return "red"
        case .hearts:
            return "red"
        }
    }
}

let hearts = Suit.hearts
let heartDescription = hearts.simpleDescription()
let heartColor = hearts.color()



enum ServerResponse {
    case result (String, String)
    case failure (String)
}

let success = ServerResponse.result("6:00 am", "8:09 am")
let failure = ServerResponse.failure("Out of cheese")

switch success {
case let .result (sunrise, sunset):
    print ("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print ("Failure... \(message)")
}


struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    func deckCard() -> String {
        return "\(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescriptions = threeOfSpades.simpleDescription()
let spadeDeck = threeOfSpades.deckCard()




