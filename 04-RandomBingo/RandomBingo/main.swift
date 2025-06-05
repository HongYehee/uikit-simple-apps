//
//  main.swift
//  RandomBingo
//
//  Created by 홍예희 on 6/5/25.
//

import Foundation

var comChoice = Int.random(in: 1...100)
var myChoice: Int = 0

while true {
    var userInput = readLine()
    
    if let input = userInput { // String? -> String
        if let number = Int(input) { // String -> Int
            myChoice = number
        }
    }
    
    if comChoice > myChoice {
        print("🔺Up")
    } else if comChoice < myChoice {
        print("🔻Down")
    } else {
        print("🎉Bingo!")
        break
    }
}
