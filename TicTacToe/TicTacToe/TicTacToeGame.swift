//
//  TicTacToeGame.swift
//  TicTacToe
//
//  Created by Korman Chen on 10/13/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import Foundation

class TicTacToeGame {
    private var activePlayer: Int
    private var Board: [Int]
    private var state: String
    
    init() {
        Board = Array(repeating: 0, count: 9)
        self.activePlayer = 1
        self.state = "Player \(activePlayer) Turn"
    }
    
    func checkMove(_ tag: Int) -> Int? {
        
        if Board[tag] == 0 {
            Board[tag] = activePlayer
            if activePlayer == 1 {
                activePlayer = 2
            }
            else {
                activePlayer = 1
            }
            
            state = "Player \(activePlayer) Turn"
            return Board[tag]
        }
        
        return nil
    }
    
    func reset() {
        Board = Array(repeating: 0, count: 9)
        state = "Player \(activePlayer) Turn"
    }
    
    func getState() -> String {
        return state
    }
    
    func checkState() -> Bool {
        
        for var index in 0..<9 { //Check Rows
            
            if Board[index] == Board[index + 1] && Board[index] == Board[index + 2] && Board[index] != 0 {
                state = "Player \(Board[index]) Wins!"
                return true
            }
            index += 2
        }
        
        for index in 0..<2 { //Check Columns
            if Board[index] == Board[index + 3] && Board[index] == Board[index + 6] && Board[index] != 0 {
                state = "Player \(Board[index]) Wins!"
                return true
            }
        }
        
        if Board[0] != 0 && Board[0] == Board[4] && Board[0] == Board[8] { //Check diagonals
            state = "Player \(Board[0]) Wins!"
            return true
        }
        else if Board[2] != 0 && Board[2] == Board[4] && Board[2] == Board[6] {
            state = "Player \(Board[0]) Wins!"
            return true
        }
        
        if Board.index(of: 0) == nil {
            state = "Tie!"
            return true
        }
        
        return false
    }
}
