//
//  ViewController.swift
//  TIcTacToe
//
//  Created by Mohamed Elbassiouny on 7/1/19.
//  Copyright © 2019 Mohamed Elbassiouny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    var gamestate = [0,0,0,0,0,0,0,0,0]
    let  winnerCombination = [[0,1,2] , [3,4,5] , [6,7,8] , [0,3,6] , [1,4,7] , [2,5,8] , [0,4,8] , [2,4,6]]
    var gameIsActive = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    @IBOutlet weak var winLabel: UILabel!
    @IBAction func playAgainButton(_ sender: UIButton) {
        
        gamestate = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        winLabel.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: .normal)
        }
    }
    
    @IBAction func player(_ sender: UIButton) {
        
        if gamestate[sender.tag - 1] == 0 && gameIsActive == true
        {
            gamestate[sender.tag - 1] = activePlayer
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "redX.png"), for: .normal)
                activePlayer = 2
                
            }else{
                sender.setImage(UIImage(named: "blackO.png"), for: .normal)
                activePlayer = 1
            }
            winLabel.isHidden = false
        }
        
        for combination in winnerCombination{
            if gamestate[combination[0]] != 0 && gamestate[combination[0]] == gamestate[combination[1]] && gamestate[combination[1]] == gamestate[combination[2]]
            {
                gameIsActive = false
                
                if gamestate[combination[0]] == 1
                {
                    print("redX win")
                    winLabel.text = "X win"
                }else
                {
                    print("blackO win")
                    winLabel.text = "O win"
                }
            }
        }
    }
}

