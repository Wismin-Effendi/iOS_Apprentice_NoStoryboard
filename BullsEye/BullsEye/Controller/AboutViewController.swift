//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Wismin Effendi on 11/1/17.
//  Copyright © 2017 Wismin Effendi. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    let aboutView = AboutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutView.vc = self
        print("inside view didLoad of About VC")
        view.addSubview(aboutView)
        aboutView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutView.topAnchor.constraintEqualToSystemSpacingBelow(view.topAnchor, multiplier: 1),
            aboutView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            aboutView.leftAnchor.constraint(equalTo: view.leftAnchor),
            aboutView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
}
