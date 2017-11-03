//
//  ChecklistItemCell.swift
//  CheckLists
//
//  Created by Wismin Effendi on 11/2/17.
//  Copyright © 2017 Wismin Effendi. All rights reserved.
//

import UIKit

class ChecklistItemCell: UITableViewCell {

    var itemLabel = UILabel()
    var checkLabel = UILabel()
    var itemChecked = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType  = .detailDisclosureButton
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(checkLabel)
        checkLabel.textAlignment = .center
        checkLabel.text = "√"
        checkLabel.font = UIFont(name: "Helvetica Neue Bold", size: 22)
        checkLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            checkLabel.widthAnchor.constraint(equalToConstant: 12)
        ])
        
        addSubview(itemLabel)
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            itemLabel.leftAnchor.constraint(equalTo: checkLabel.rightAnchor, constant: 16),
            itemLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -80),
            itemLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
