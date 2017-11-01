//
//  MainView.swift
//  BullsEye
//
//  Created by Wismin Effendi on 10/31/17.
//  Copyright © 2017 Wismin Effendi. All rights reserved.
//

import UIKit

class MainView: UIView {

    let backgroundImageView = UIImageView()
    let hitMeButton = UIButton(type: UIButtonType.custom)
    let infoButton = UIButton(type: UIButtonType.custom)
    let roundLabel = UILabel()
    let titleRoundLabel = UILabel()
    let startOverButton = UIButton(type: UIButtonType.system)
    let scoreStaticLabel = UILabel()
    let scoreLabel = UILabel()
    let slider = UISlider()
    let minSliderLabel = UILabel()
    let maxSliderLabel = UILabel()
    let descriptionLabel = UILabel()
    let targetLabel = UILabel()
    let vc = AppDelegate.shared.viewController
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.groupTableViewBackground
        setupBackgroundView()
        setupViews()
    }
    
    var isLandscapeMode: Bool {
        return UIDevice.current.orientation.isLandscape
    }
    
    func setupBackgroundView() {
        // Set image view for background
        self.addSubview(backgroundImageView)
        backgroundImageView.image = #imageLiteral(resourceName: "Background")
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupViews() {
        
        // Hit Me! button
        self.addSubview(hitMeButton)
        hitMeButton.setBackgroundImage(#imageLiteral(resourceName: "Button-Normal"), for: .normal)
        hitMeButton.setBackgroundImage(#imageLiteral(resourceName: "Button-Highlighted"), for: .highlighted)
        hitMeButton.reversesTitleShadowWhenHighlighted = true
        hitMeButton.setTitle("Hit Me!", for: .normal)
        let titleColor = UIColor(red: 96/255, green: 30/255, blue: 0, alpha: 1.0)
        hitMeButton.setTitleColor(titleColor, for: .normal)
        hitMeButton.titleLabel?.shadowColor = UIColor(white: 1.0, alpha: 0.5)
        hitMeButton.titleLabel?.shadowOffset = CGSize(width: 0, height: 1)
        hitMeButton.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        hitMeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hitMeButton.widthAnchor.constraint(equalToConstant: 100),
            hitMeButton.heightAnchor.constraint(equalToConstant: 37),
            hitMeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            hitMeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 20)
        ])

        hitMeButton.addTarget(vc, action: #selector(ViewController.buttonTapped(_:)), for: .touchUpInside)
        
        // light info button
        self.addSubview(infoButton)
        infoButton.setImage(#imageLiteral(resourceName: "InfoButton"), for: .normal)
        infoButton.setBackgroundImage(#imageLiteral(resourceName: "SmallButton"), for: .normal)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32),
            infoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            infoButton.widthAnchor.constraint(equalToConstant: 32),
            infoButton.heightAnchor.constraint(equalToConstant: 32)
            ])

        // # of round label
        self.addSubview(roundLabel)
        roundLabel.textAlignment = .right
        roundLabel.textColor = .white
        roundLabel.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        roundLabel.shadowOffset = CGSize(width: 0, height: 1)
        roundLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        roundLabel.translatesAutoresizingMaskIntoConstraints = false
        roundLabel.text = "999"
        NSLayoutConstraint.activate([
            roundLabel.bottomAnchor.constraint(equalTo: infoButton.bottomAnchor),
            roundLabel.topAnchor.constraint(equalTo: infoButton.topAnchor),
            roundLabel.rightAnchor.constraint(equalTo: infoButton.leftAnchor, constant: -36),
            roundLabel.widthAnchor.constraint(equalToConstant: 44)
        ])

        // label title round:
        self.addSubview(titleRoundLabel)
        titleRoundLabel.textAlignment = .left
        titleRoundLabel.textColor = .white
        titleRoundLabel.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        titleRoundLabel.shadowOffset = CGSize(width: 0, height: 1)
        titleRoundLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        titleRoundLabel.translatesAutoresizingMaskIntoConstraints = false
        titleRoundLabel.text = "Round: "
        NSLayoutConstraint.activate([
            titleRoundLabel.bottomAnchor.constraint(equalTo: roundLabel.bottomAnchor),
            titleRoundLabel.rightAnchor.constraint(equalTo: roundLabel.leftAnchor),
            titleRoundLabel.widthAnchor.constraint(equalToConstant: 56)
        ])
        
        // startOver button
        // light info button
        self.addSubview(startOverButton)
        startOverButton.setImage(#imageLiteral(resourceName: "StartOverIcon"), for: .normal)
        startOverButton.setBackgroundImage(#imageLiteral(resourceName: "SmallButton"), for: .normal)
        startOverButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startOverButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32),
            startOverButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -28),
            startOverButton.widthAnchor.constraint(equalToConstant: 32),
            startOverButton.heightAnchor.constraint(equalToConstant: 32)
        ])

        startOverButton.addTarget(vc, action: #selector(ViewController.startNewGame), for: .touchUpInside)
        
        // Score label and score value label
        self.addSubview(scoreStaticLabel)
        scoreStaticLabel.textAlignment = .left
        scoreStaticLabel.textColor = .white
        scoreStaticLabel.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        scoreStaticLabel.shadowOffset = CGSize(width: 0, height: 1)
        scoreStaticLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        scoreStaticLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreStaticLabel.text = "Score: "
        NSLayoutConstraint.activate([
            scoreStaticLabel.topAnchor.constraint(equalTo: hitMeButton.bottomAnchor, constant: 40),
            scoreStaticLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -36),
            scoreStaticLabel.widthAnchor.constraint(equalToConstant: 56),
        ])
        
        self.addSubview(scoreLabel)
        scoreLabel.textAlignment = .right
        scoreLabel.textColor = .white
        scoreLabel.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        scoreLabel.shadowOffset = CGSize(width: 0, height: 1)
        scoreLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "999999"
        NSLayoutConstraint.activate([
            scoreLabel.leftAnchor.constraint(equalTo: scoreStaticLabel.rightAnchor, constant: 0),
            scoreLabel.bottomAnchor.constraint(equalTo: scoreStaticLabel.bottomAnchor),
            scoreLabel.widthAnchor.constraint(equalToConstant: 80)
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
        minSliderLabel.textColor = .white
        maxSliderLabel.textColor = .white
        minSliderLabel.text = "1"
        maxSliderLabel.text = "100"
        minSliderLabel.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        minSliderLabel.shadowOffset = CGSize(width: 0, height: 1)
        minSliderLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 14)
        maxSliderLabel.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        maxSliderLabel.shadowOffset = CGSize(width: 0, height: 1)
        maxSliderLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 14)
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
        descriptionLabel.textColor = .white
        descriptionLabel.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        descriptionLabel.shadowOffset = CGSize(width: 0, height: 1)
        descriptionLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        targetLabel.textColor = .white
        targetLabel.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        targetLabel.shadowOffset = CGSize(width: 0, height: 1)
        targetLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        descriptionLabel.text = "Put the Bull's Eye as close as you can to:  "
        targetLabel.text = "100"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        targetLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -16),
            targetLabel.leftAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 8),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            targetLabel.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
