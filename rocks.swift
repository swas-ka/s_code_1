// This gist demonstrates how to create a Rock, Paper, Scissors game in iOS using swift.
// The "GAME OF ROCK, SCISSORS, PAPER" was originally published in David Ahl's 
// "Basic Computer Games" back in 1978. "Basic Computer Games" was comprised of 101
// computer games written in the BASIC programming language and was often used
// by beginner programmers as a means of learning to code. Therefore, I've named
// my iOS app written in Swift "Rock, Scissors, Paper" instead of "Rock, Paper, Scissors"
// in honor of Ahl's book.
// Note that this is a simple single view app with one ViewController. The view contains 
// a few static labels which do not change, and three buttons: ROCK, SCISSORS, PAPER.
// When a user clicks on one of the buttons, the app will make its choice, and the outcome
// of the game will be displayed to the player by a dialog popup message.




//
//  ViewController.swift
//  Rock, Scissors, Paper
//
//  Created by Christopher Pedersen on 9/4/18.
//  Copyright © 2018 Christopher Pedersen. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onRockButtonPress(_ sender: Any) {
        let opponentSelection: String = makeOpponentSelection()
        var outcome: String = "..."
        if opponentSelection == "ROCK" {
            outcome = "OPPONENT SHOOTS ROCK. TIE GAME."
        } else if opponentSelection == "SCISSORS" {
            outcome = "OPPONENT SHOOTS SCISSORS. YOU WIN!"
        } else if opponentSelection == "PAPER" {
            outcome = "OPPONENT SHOOTS PAPER. YOU LOSE!"
        }
        displayDialog(with: outcome)
    }
    
    @IBAction func onScissorsButtonPress(_ sender: Any) {
        let opponentSelection: String = makeOpponentSelection()
        var outcome: String = "..."
        if opponentSelection == "ROCK" {
            outcome = "OPPONENT SHOOTS ROCK. YOU LOSE!"
        } else if opponentSelection == "SCISSORS" {
            outcome = "OPPONENT SHOOTS SCISSORS. TIE GAME."
        } else if opponentSelection == "PAPER" {
            outcome = "OPPONENT SHOOTS PAPER. YOU WIN!"
        }
        displayDialog(with: outcome)
    }
    
    @IBAction func onPaperButtonPress(_ sender: Any) {
        let opponentSelection: String = makeOpponentSelection()
        var outcome: String = "..."
        if opponentSelection == "ROCK" {
            outcome = "OPPONENT SHOOTS ROCK. YOU WIN!"
        } else if opponentSelection == "SCISSORS" {
            outcome = "OPPONENT SHOOTS SCISSORS. YOU LOSE!"
        } else if opponentSelection == "PAPER" {
            outcome = "OPPONENT SHOOTS PAPER. TIE GAME."
        }
        displayDialog(with: outcome)
    }
    
    func displayDialog(with dialogMessage: String) {
        // REFERENCE (UIAlertViewController): https://developer.apple.com/documentation/uikit/uialertcontroller
        let alert = UIAlertController(title: "", message: dialogMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func makeOpponentSelection() -> String {
        var option: [String] = []
        option.append("ROCK")
        option.append("SCISSORS")
        option.append("PAPER")
        let randomNumber = Int(arc4random_uniform(3))
        return option[randomNumber]
    }


}
