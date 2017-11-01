//
//  ViewController.swift
//  BullsEye
//
//  Created by Wismin Effendi on 10/31/17.
//  Copyright © 2017 Wismin Effendi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraintEqualToSystemSpacingBelow(view.topAnchor, multiplier: 1).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        startNewRound()
    }


    @objc func buttonTapped(_ sender: UIButton) {
        print("button tapped...")
        showAlert()
    }
    
    @objc func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
        print("The value of the slider is now: \(sender.value)")
    }

    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        mainView.slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        mainView.targetLabel.text = String(targetValue)
    }
    
    private func showAlert() {
        let message =
        """
        The value of the slider is: \(currentValue)
        The target value is: \(targetValue)
        """
        
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        startNewRound()
    }

}

