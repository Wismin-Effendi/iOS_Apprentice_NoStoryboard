//
//  AddItemViewController.swift
//  CheckLists
//
//  Created by Wismin Effendi on 11/2/17.
//  Copyright © 2017 Wismin Effendi. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController,
                               didFinishAdding item: ChecklistItem)
    func itemDetailViewController(_ controller: ItemDetailViewController,
                               didFinishEditing item: ChecklistItem)
}
    

class ItemDetailViewController: UITableViewController {

    var doneBarButton: UIBarButtonItem!
    var itemNameCell: UITableViewCell = UITableViewCell()
    var itemNameText: UITextField = UITextField()
    
    var spareCell: UITableViewCell = UITableViewCell()
    var spareNameText: UITextField = UITextField()
    
    weak var delegate: ItemDetailViewControllerDelegate?
    
    var itemToEdit: ChecklistItem?
    
    override func loadView() {
        super.loadView()
        
        // set the title
        self.title = "Add Item"
        
        // item cell
        self.itemNameCell.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        self.itemNameText = UITextField(frame: self.itemNameCell.contentView.bounds.insetBy(dx: 15, dy: 0))
        self.itemNameText.placeholder = "New item"
        self.itemNameCell.addSubview(self.itemNameText)
        
        // spare celll
        self.spareCell.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        self.spareNameText = UITextField(frame: self.itemNameCell.contentView.bounds.insetBy(dx: 15, dy: 0))
        self.spareNameText.placeholder = "Do not use"
        self.spareCell.addSubview(self.spareNameText)
    }
    
    fileprivate func configureItemNameText() {
        itemNameText.delegate = self
        itemNameText.font = UIFont.systemFont(ofSize: 17)
        itemNameText.adjustsFontSizeToFitWidth = false
        itemNameText.autocapitalizationType = .sentences
        itemNameText.returnKeyType = .done
        itemNameText.enablesReturnKeyAutomatically = true
        itemNameText.addTarget(self, action: #selector(ItemDetailViewController.done), for: .editingDidEndOnExit)
    }
    
    fileprivate func configureNavigationBar() {
        // navigationItem.title = "Add Item"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        doneBarButton.isEnabled = false
        navigationItem.rightBarButtonItem = doneBarButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
       
        configureNavigationBar()
        configureItemNameText()
        
        if let item = itemToEdit {
            title = "Edit Item"
            itemNameText.text = item.text
            doneBarButton.isEnabled = true
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        itemNameText.becomeFirstResponder()
    }
    
    @objc func cancel() {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    @objc func done() {
        if let itemToEdit = itemToEdit {
            itemToEdit.text = itemNameText.text!
            delegate?.itemDetailViewController(self, didFinishEditing: itemToEdit)
        } else {
        let item = ChecklistItem(text: itemNameText.text!, checked: false)
        delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1:
            return 1
        default:
            fatalError("Unknown number of sections")
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
        case (0,0):
            return self.itemNameCell
        case (1,0):
            return self.spareCell
        default:
            fatalError("Unknown section")
        }
    }
 
    // Customize the section headings for each section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Grocery"
        case 1:
            return "Spare"
        default:
            fatalError("Unknown section")
        }
    }
}


extension ItemDetailViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let oldText = textField.text,
            let stringRange = Range(range, in: oldText) else { return false }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        doneBarButton.isEnabled = !newText.isEmpty
        return true
    }
}
