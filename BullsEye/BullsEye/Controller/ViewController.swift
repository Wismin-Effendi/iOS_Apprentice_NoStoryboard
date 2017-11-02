//
//  ViewController.swift
//  BullsEye
//
//  Created by Wismin Effendi on 10/31/17.
//  Copyright © 2017 Wismin Effendi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalTransitionStyle = .flipHorizontal
        modalPresentationStyle = .fullScreen
        
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraintEqualToSystemSpacingBelow(view.topAnchor, multiplier: 1).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        startNewGame()
    }


    @objc func buttonTapped(_ sender: UIButton) {
        print("button tapped...")
        showAlert()
    }
    
    @objc func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
        print("The value of the slider is now: \(sender.value)")
    }
    
    @objc func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    @objc func showAboutVC() {
        print("going to show aboutVC")
        present(AboutViewController(), animated: true, completion: nil)
    }

    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        mainView.slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        mainView.targetLabel.text = String(targetValue)
        mainView.scoreLabel.text = String(score)
        mainView.roundLabel.text = String(round)
    }
    
    private func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let message =
        """
        You scored \(points) points
        """
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {[unowned self]
            action in self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

