//
//  ViewController.swift
//  TicTacToe
//
//  Created by Korman Chen on 10/13/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {
    
    //MARK: Properties
    private var TicTacToeModel = TicTacToeGame()
    @IBOutlet weak var GameStateLabel: UILabel!
    @IBOutlet weak var PlayAgainButton: UIButton!
    
    //MARK: Actions
    @IBAction func placeMoveButton(_ sender: UIButton) {
        
        let player = TicTacToeModel.checkMove(sender.tag - 1)
        
        if player == 1 {
            sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
        }
        else if player == 2 {
            sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
        }
        else {
            GameStateLabel.text = "Invalid Move"
        }
        
        PlayAgainButton.isHidden = !TicTacToeModel.checkState()
        PlayAgainButton.isEnabled = TicTacToeModel.checkState()
        GameStateLabel.text = TicTacToeModel.getState()
    }
    
    @IBAction func PlayAgainAction(_ sender: UIButton) {
        if sender == PlayAgainButton {
            TicTacToeModel.reset()
            PlayAgainButton.isHidden = true
            PlayAgainButton.isEnabled = false
            GameStateLabel.text = TicTacToeModel.getState()
            
            for tag in 1...9 {
                let button = view.viewWithTag(tag) as! UIButton
                button.setImage(nil, for: UIControlState())
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GameStateLabel.text = TicTacToeModel.getState()
        PlayAgainButton.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

