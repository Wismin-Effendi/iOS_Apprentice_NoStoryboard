//
//  MainView.swift
//  BullsEye
//
//  Created by Wismin Effendi on 10/31/17.
//  Copyright © 2017 Wismin Effendi. All rights reserved.
//

import UIKit

class MainView: UIView {

    let hitMeButton = UIButton(type: UIButtonType.system)
    let infoButton = UIButton(type: UIButtonType.infoLight)
    let numberOfRoundLabel = UILabel()
    let titleRoundLabel = UILabel()
    let startOverButton = UIButton(type: UIButtonType.system)
    let scoreLabel = UILabel()
    let scoreValueLabel = UILabel()
    let slider = UISlider()
    let minSliderLabel = UILabel()
    let maxSliderLabel = UILabel()
    let descriptionLabel = UILabel()
    let targetLabel = UILabel()
    let vc = AppDelegate.shared.viewController
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.groupTableViewBackground
        setupViews()
    }
    
    var isLandscapeMode: Bool {
        return UIDevice.current.orientation.isLandscape
    }
    
    
    func setupViews() {
        
        // Hit Me! button
        self.addSubview(hitMeButton)
        hitMeButton.setTitle("Hit Me!", for: .normal)
        hitMeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        hitMeButton.backgroundColor = .green
        hitMeButton.layer.masksToBounds = true
        hitMeButton.layer.cornerRadius = 5
        hitMeButton.translatesAutoresizingMaskIntoConstraints = false
        hitMeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        hitMeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        hitMeButton.addTarget(vc, action: #selector(ViewController.buttonTapped(_:)), for: .touchUpInside)
        
        // light info button
        self.addSubview(infoButton)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32).isActive = true
        infoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32).isActive = true
        
        // # of round label
        self.addSubview(numberOfRoundLabel)
        numberOfRoundLabel.textAlignment = .right
        numberOfRoundLabel.textColor = UIColor.darkGray
        numberOfRoundLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfRoundLabel.text = "999"
        NSLayoutConstraint.activate([
            numberOfRoundLabel.bottomAnchor.constraint(equalTo: infoButton.bottomAnchor),
            numberOfRoundLabel.topAnchor.constraint(equalTo: infoButton.topAnchor),
            numberOfRoundLabel.rightAnchor.constraint(equalTo: infoButton.leftAnchor, constant: -18),
            numberOfRoundLabel.widthAnchor.constraint(equalToConstant: 36)
        ])

        // label title round:
        self.addSubview(titleRoundLabel)
        titleRoundLabel.textAlignment = .left
        titleRoundLabel.textColor = .darkGray
        titleRoundLabel.translatesAutoresizingMaskIntoConstraints = false
        titleRoundLabel.text = "Round: "
        NSLayoutConstraint.activate([
            titleRoundLabel.bottomAnchor.constraint(equalTo: numberOfRoundLabel.bottomAnchor),
            titleRoundLabel.rightAnchor.constraint(equalTo: numberOfRoundLabel.leftAnchor),
            titleRoundLabel.widthAnchor.constraint(equalToConstant: 56)
        ])
        
        // startOver button
        // light info button
        self.addSubview(startOverButton)
        startOverButton.setTitle("Start Over", for: .normal)
        startOverButton.translatesAutoresizingMaskIntoConstraints = false
        startOverButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32).isActive = true
        startOverButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -28).isActive = true
        
        // Score label and score value label
        self.addSubview(scoreLabel)
        scoreLabel.textAlignment = .left
        scoreLabel.textColor = .darkGray
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Score: "
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: hitMeButton.bottomAnchor, constant: 40),
            scoreLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -36),
            scoreLabel.widthAnchor.constraint(equalToConstant: 56),
        ])
        
        self.addSubview(scoreValueLabel)
        scoreValueLabel.textAlignment = .right
        scoreValueLabel.textColor = .darkGray
        scoreValueLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreValueLabel.text = "999999"
        NSLayoutConstraint.activate([
            scoreValueLabel.leftAnchor.constraint(equalTo: scoreLabel.rightAnchor, constant: 0),
            scoreValueLabel.bottomAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            scoreValueLabel.widthAnchor.constraint(equalToConstant: 80)
            ])
        
        // Slider
        self.addSubview(slider)
        slider.minimumValue = 1.0
        slider.maximumValue = 100.0
        slider.setValue(27, animated: true)
        slider.isContinuous = true
        slider.addTarget(vc, action: #selector(ViewController.sliderMoved(_:)), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            slider.bottomAnchor.constraint(equalTo: hitMeButton.topAnchor, constant: -40),
            slider.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 80),
            slider.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -80)
        ])
        
        //minSliderLabel and maxSliderLabel
        self.addSubview(minSliderLabel)
        self.addSubview(maxSliderLabel)
        minSliderLabel.textAlignment = .right
        maxSliderLabel.textAlignment = .left
        minSliderLabel.textColor = .darkGray
        maxSliderLabel.textColor = .darkGray
        minSliderLabel.text = "1"
        maxSliderLabel.text = "100"
        minSliderLabel.translatesAutoresizingMaskIntoConstraints = false
        maxSliderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            minSliderLabel.rightAnchor.constraint(equalTo: slider.leftAnchor, constant: -8),
            maxSliderLabel.leftAnchor.constraint(equalTo: slider.rightAnchor, constant: 8),
            minSliderLabel.centerYAnchor.constraint(equalTo: slider.centerYAnchor),
            maxSliderLabel.centerYAnchor.constraint(equalTo: slider.centerYAnchor),
        ])
        
        // descriptionLabel and gameValueLabel
        self.addSubview(descriptionLabel)
        self.addSubview(targetLabel)
        descriptionLabel.textAlignment = .right
        targetLabel.textAlignment = .left
        descriptionLabel.textColor = .darkGray
        targetLabel.textColor = .darkGray
        descriptionLabel.text = "Put the Bull's Eye as close as you can to:  "
        targetLabel.text = "100"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        targetLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -16),
            targetLabel.leftAnchor.constraint(equalTo: descriptionLabel.rightAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            targetLabel.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
