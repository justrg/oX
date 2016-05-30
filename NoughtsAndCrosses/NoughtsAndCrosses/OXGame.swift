//
//  OXGame.swift
//  NoughtsAndCrosses
//
//  Created by Justin on 5/30/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import Foundation

enum CellType:String {
    
    case O = "0"
    case X = "X"
    case EMPTY = ""
}

enum OXGameState:String {
    
    case inProgress
    case complete_no_one_won
    case complete_someone_one
}
class OXGame {
    
    private var board = [CellType](count: 9, repeatedValue: CellType.EMPTY)
    
    private var startType: CellType = CellType.X
    
    private func turn() -> Int {
        
        var count = 0
        for cell in board {
            if cell != CellType.EMPTY {
                count = count + 1
            }
        }
        print ("turn is \(count)")
        return count
    }
    
    func whosTurn() -> CellType {
        if turn() % 2 == 0 {
            return CellType.O
        } else {
            return CellType.X
        }
    }
    
    func typeAtIndex(index: Int) -> CellType {
        return board[index]
    }
    
    func playMove(index: Int) -> CellType {
        board[index] = whosTurn()
        return board[index]
    }
    
    func winDetection(){
        // Vertical
        if(board[0] == board[3] == board[6]){
            return true
        }
        if(board[1] == board[4] == board[7]){
            return true
        }
        if(board[2] == board[5] == board[8]){
            return true
        }
        
        //Horizontal
        if(board[0] == board[1] == board[2]){
            return true
        }
        if(board[3] == board[4] == board[5]){
            return true
        }
        if(board[6] == board[7] == board[8]){
            return true
        }
        //Diag
        if(board[0] == board[4] == board[8]){
            return true
        }
        if(board[2] == board[4] == board[6]){
            return true
        }

    }
}