//
//  Game.swift
//  FizzBuzz
//
//  Created by ditthales on 14/02/23.
//

import Foundation

class Game{
    
    var score: Int
    let brain: Brain
    var totalLives: Int
    var remainingLives: Int
    
    init(totalLives: Int = 3) {
        self.score = 0
        self.brain = Brain()
        self.totalLives = totalLives
        self.remainingLives = totalLives
    }
    
    func play(withMove move: Move, completionResult: @escaping (Bool) -> Void){
        
        if move == brain.check(number: score + 1){
            self.score += 1
            completionResult(true)
        } else {
            self.remainingLives -= 1
            completionResult(false)
        }

    }
    
}
