//
//  AboutView.swift
//  BullsEye
//
//  Created by Wismin Effendi on 11/1/17.
//  Copyright © 2017 Wismin Effendi. All rights reserved.
//

import UIKit

class AboutView:UIView {

    let backgroundImageView = UIImageView()

    let closeButton = UIButton()
    let textView = UITextView()
    let webView = UIWebView()
    
    var vc: AboutViewController!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBackgroundView()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    fileprivate func setupTextView() {
        // text view
        self.addSubview(textView)
        textView.isEditable = false
        let aboutText =
        """
        *** Bull's Eye ***

        Welcome to the awesome game of Bull's Eye where you can win points and
        fame by dragging a slider.

        Your goal is to place the slider as close as possible to the target
        value. The closer you are, the more points you score. Enjoy!
        """
        textView.text = aboutText
        textView.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        textView.textColor = .lightGray
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -20),
            textView.topAnchor.constraint(equalTo: self.topAnchor),
            textView.leftAnchor.constraint(equalTo: self.leftAnchor),
            textView.rightAnchor.constraint(equalTo: self.rightAnchor)
            ])
    }
    
    fileprivate func setupCloseButton() {
        // close button at the bottom
        self.addSubview(closeButton)
        closeButton.setBackgroundImage(#imageLiteral(resourceName: "Button-Normal"), for: .normal)
        closeButton.setBackgroundImage(#imageLiteral(resourceName: "Button-Highlighted"), for: .highlighted)
        closeButton.reversesTitleShadowWhenHighlighted = true
        closeButton.setTitle("Close", for: .normal)
        let titleColor = UIColor(red: 96/255, green: 30/255, blue: 0, alpha: 1.0)
        closeButton.setTitleColor(titleColor, for: .normal)
        closeButton.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        closeButton.titleLabel?.shadowColor = UIColor(white: 1.0, alpha: 0.5)
        closeButton.titleLabel?.shadowOffset = CGSize(width: 0, height: 1)
        closeButton.addTarget(vc, action: #selector(AboutViewController.close), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            closeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 80)
            ])
    }
    
    func setupViews() {
        
        setupCloseButton()
        
        // setupTextView()
        
        
        // setup WebView
        self.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -20),
            webView.topAnchor.constraint(equalTo: self.topAnchor),
            webView.leftAnchor.constraint(equalTo: self.leftAnchor),
            webView.rightAnchor.constraint(equalTo: self.rightAnchor)
            ])
    }

}

