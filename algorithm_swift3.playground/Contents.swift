//: Playground - noun: a place where people can play

import UIKit

// FIZZ BUZZ

func fizzBuzz(n: Int) {
    
    if n % 3 == 0 {
        print ("fizz")
    }
    
    if n % 5 == 0 {
        print ("buzz")
    }
    
    if n % 3 == 0 && n % 5 == 0 {
        print("fizz buzz")
    }
}

fizzBuzz(n: 1)
fizzBuzz(n: 2)
fizzBuzz(n: 3)

//Binary Search

let num = [1,2,4,56,7,8,123,3,51,34]

func findBinarySearch(find searchValue: Int, in collection: [Int]) -> Bool {
    
    var leftIndex = 0 //index
    var rightIndex = collection.count - 1//index
    
    while leftIndex <= rightIndex {
        
        let middleIndex = (leftIndex + rightIndex) / 2
    
        let middleValue = collection[middleIndex]
        
        print ("middleValue: \(middleValue), leftIndex: \(leftIndex), rightIndex: \(rightIndex), collection: \(collection[leftIndex], collection[rightIndex])")
        
        if searchValue == middleValue {
            return true
        }
        
        if searchValue < middleValue {
            rightIndex = middleIndex - 1
        }
        
        if searchValue > middleValue {
            leftIndex = middleIndex + 1
        }
    }
    
    return false
}

findBinarySearch(find: 1, in: num)
//findBinarySearch(find: 56, in: num)

//Factorial & Recursion

func factorial(n: Int) -> Int {
    
    var finalValue: Int = 1
    
    for i in 1...n {
        finalValue = finalValue * i
    }
    
    return finalValue
}

print ("Factorial of \(4): \(factorial(n: 5))")

// use recursive if you have a breaking point
// where it reset to calling itself
func recursiveFactorial(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    
    return n * recursiveFactorial(n: n - 1)
}
print ("Factorial of \(5): \(recursiveFactorial(n: 5))")

// find the count of the names
// using dicitionary
let names = ["Romeo", "John", "Romeo", "Rey"]
func mostCommonName(group: [String]) -> [String: Int] {

    var nameDict = [String: Int]()
    
    for item in group {
        if let count = nameDict[item] {
            nameDict[item] = count + 1
        } else {
            nameDict[item] = 1
        }
    }

    return nameDict
}

print(mostCommonName(group: names))

//reverse a string
let string = "The quick brown fox jumps over the red corridor"

func reverseWordsAlternate(sentence: String) -> String {
    let allWords = sentence.split(separator: " ")
    var newSentence = ""
    
    for index in 0...allWords.count - 1 {
        let word = allWords[index]
        if newSentence != "" {
            newSentence += " "
        }
        if index % 2 == 1 {
            let reverseWord = String(word.reversed())
            newSentence += reverseWord.removeVowels()
        } else {
            let subWord = String(word)
            newSentence += subWord.removeVowels()
            
        }
    }
    
    return newSentence
}

// remove the vowels
extension String {
    func removeVowels() -> String {
        var newString = self
        for i in ["a", "e", "i", "u", "o"] {
            newString = newString.replacingOccurrences(of: i, with: "")
        }
        return newString
    }
}

print(reverseWordsAlternate(sentence: string))

//fibbnacci
// 1, 1, 2,3,5, 8
func fibbonacci(of: Int) -> [Int] {
    
    var start = 1
    var next = 1
    
    var fibboSeq = [1, 1]
    
    for _ in 0...of {
        start = fibboSeq[fibboSeq.count - 2]
        next = fibboSeq.last!
        fibboSeq.append(start + next)
    }
    
    return fibboSeq
}

print (fibbonacci(of: 3))

//recursion
func fibRecursion(numStep: Int, first: Int, second: Int) -> [Int] {
    if numStep == 0 {
        return []
    }
    return [first + second] + fibRecursion(numStep: numStep - 1, first: second, second: first + second)
}

print ([0, 1] + fibRecursion(numStep: 5, first: 1, second: 1))


//wrapping arrays
let tracks = ["a", "b", "c", "d", "e"]

var selectedTrack = "d"

func selectTrack(_ tracks: [String], _ find: String) -> [String] {

    var newTracks = [String]()
    var priority = [String]()

    for track in tracks {
        // find the selectedTrack, and check if the newTracks array is > 0 append the remaining list
        if track == find || newTracks.count > 0 {
            newTracks.append(track)
        } else {
            // store the other list in a new storage
            priority.append(track)
        }
    }

    return newTracks + priority
}

print (selectTrack(tracks, selectedTrack))

func prefixTrack(arr: [String], find: String) {
    let index = arr.index { $0 == find }
    let originalTrack = arr.prefix(upTo: index!)
    let currentTrack = arr.suffix(from: index!)
    print (currentTrack + originalTrack)
}

prefixTrack(arr: tracks, find: "c")

//MARK: - High Order Function

//MAP
// [1, 2, 3, 4] -> [2, 4, 6, 8] multiply by 2
let elements = [1, 2, 3, 4]

let mapped = elements.map({ return $0 * 2 })
mapped

//FILTER
let filtered = elements.filter({ return $0 % 2 == 0 })
filtered

// REDUCE
let reduced = elements.reduce(0) { (sum, number) in return sum + number }
reduced

// Recursive Binary Tree

/*
        10
       /   \
      5    14
     /     / \
    1     11   20

 */

class Node {
    var value: Int
    var left: Node?
    var right: Node?

    init (value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
}

//left branch
var one = Node(value: 1, left: nil, right: nil)
var five = Node(value: 5, left: one, right: nil)

//right branch
var eleven = Node(value: 11, left: nil, right: nil)
var twenty = Node(value: 20, left: nil, right: nil)
var fourteen = Node(value: 14, left: eleven, right: twenty)

//top branch
var top = Node(value: 10, left: five, right: fourteen)


func searchNode(find: Node?, searchValue: Int) -> Bool {
    if find == nil {
        return false
    }

    if find?.value == searchValue {
        return true
    } else if searchValue < find!.value {
        return searchNode(find: find?.left, searchValue: searchValue)
    } else {
        return searchNode(find: find?.right, searchValue: searchValue)
    }
}

searchNode(find: top, searchValue: 11)

// Date

let dateDisplay = Date(timeIntervalSinceNow: -60 * 60 * 24)

extension Date {
    func displayTimeAgo() -> String {
        let seconds = Int(Date().timeIntervalSince(self))

        let minutes = 60
        let hours = 60 * minutes
        let days = 24 * hours
        let weeks = days * 7

        if seconds < minutes {
            return "\(seconds) seconds ago"
        } else if seconds < hours {
            return "\(seconds / minutes) minutes ago"
        } else if seconds < days {
            return "\(seconds / hours ) hours ago"
        } else if seconds < weeks {
            return "\(seconds / days) days ago"
        }
        return "\(seconds / weeks) weeks ago"
    }
}

dateDisplay.displayTimeAgo()


// largest palindrome

let sentence = "madam anna kayak notaplindrome anna Civic racecar"

func findPalindrome(word: String) -> Bool {
    let characters = Array(word)
    var currentIndex = 0

    while currentIndex < characters.count / 2 {

//        print ("current Index: \(characters[currentIndex])")
//        print ("middle index: \(characters[characters.count - currentIndex - 1])")
        if characters[currentIndex] != characters[characters.count - currentIndex - 1] {
            return false
        }
        currentIndex += 1
    }
    return true
}

let words = sentence.components(separatedBy: " ")
var palindroms = [String: Int]()
words.forEach { (word) in
    if findPalindrome(word: word) {
        let count = palindroms[word] ?? 0
        palindroms[word] = count + 1
    }
}

print (palindroms)

// creating a closure

func transformString(closure: (String) -> String, value: String) -> String {
    return closure(value)
}

func transformUpperCase(string: String) -> String {
    return string.uppercased()
}

let transformClosure = transformString(closure: transformUpperCase,value: "romeo enso");

print (transformClosure)

func numberRolls(task: (Int) -> Int, collection: [Int]) -> [Int] {
    var nums = [Int]()

    for num in collection {
        nums.append(task(num))
    }
    return nums
}

func plusTwo(values: Int) -> Int {
    return values + 2
}

func multiplByTwo(values: Int) -> Int {
    return values * 2
}

let transformNumberRolls = numberRolls(task: multiplByTwo, collection: [1,2,3,4,5])

print (transformNumberRolls)

// Flattening Nested Arrays using Recursion

// [1, 2] -> [1, 2]
// [1, [2]] -> [1, 2]
// [1, 2,[3,4]] -> [1,2,3,4]

func flattenArray(nums: [Any]) -> [Int] {

    var myFlattenArr = [Int]()

    for num in nums {
        if num is Int {
            myFlattenArr.append(num as! Int)
        } else if num is [Any] {

            let recursionResult = flattenArray(nums: num as! [Any])

            for result in recursionResult {
                myFlattenArr.append(result)
            }
        }
    }

    return myFlattenArr
}

let flatArray = flattenArray(nums: [1,2, [3, 4, [5]]])

print (flatArray)






























