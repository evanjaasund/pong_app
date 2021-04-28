//
//  MenuVC.swift
//  Ping pong
//
//  Created by Evan Jåsund Kassab on 27/04/2021.
//

import Foundation
import UIKit

enum gameType {
    case lett
    case medium
    case vanskelig
    case player2
}

class MenuVC: UIViewController {
    

    @IBAction func Player2(_ sender: Any) {
        flyttTilSpill(game: .player2)
    }
    
    @IBAction func Lett(_ sender: Any) {
        flyttTilSpill(game: .lett)
    }
    
    @IBAction func Medium(_ sender: Any) {
        flyttTilSpill(game: .medium)
    }
    
    @IBAction func Vanskelig(_ sender: Any) {
        flyttTilSpill(game: .vanskelig)
    }
    
    
    
    func flyttTilSpill(game: gameType){
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = game
        
        self.navigationController?.pushViewController(gameVC, animated: true)
                
    }
}
