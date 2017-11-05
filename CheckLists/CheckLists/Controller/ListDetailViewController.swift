//
//  ListDetailViewController.swift
//  CheckLists
//
//  Created by Wismin Effendi on 11/3/17.
//  Copyright © 2017 Wismin Effendi. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist)
}

class ListDetailViewController: UITableViewController {

    var staticCell: UITableViewCell = UITableViewCell()
    var textField: UITextField!
    var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ListDetailViewControllerDelegate?
    var checklistToEdit: Checklist?
    
    override func loadView() {
        super.loadView()
        
        // item cell
        self.staticCell.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        self.textField = UITextField(frame: self.staticCell.contentView.bounds.insetBy(dx: 15, dy: 0))
        self.textField.placeholder = "Name of the List"
        self.staticCell.addSubview(self.textField)
    }
    
    fileprivate func configureTextField() {
        textField.delegate = self
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.adjustsFontSizeToFitWidth = false
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        textField.addTarget(self, action: #selector(done), for: .editingDidEndOnExit)
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

        title = "Add Checklist"
        navigationItem.largeTitleDisplayMode = .never
        configureNavigationBar()
        configureTextField()
        
        if let checklist = checklistToEdit {
            title = "Edit Checklist"
            textField.text = checklist.name
            doneBarButton.isEnabled = true
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }

    // MARK: - Actions
    @objc func cancel() {
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    @objc func done() {
        if let checklist = checklistToEdit {
            checklist.name = textField.text!
            delegate?.listDetailViewController(self, didFinishEditing: checklist)
        } else {
            let checklist = Checklist(name: textField.text!)
            delegate?.listDetailViewController(self, didFinishAdding: checklist)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.staticCell
    }
    
}

extension ListDetailViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let oldText = textField.text,
            let stringRange = Range(range, in: oldText) {
            let newText = oldText.replacingCharacters(in: stringRange, with: string)
            
            doneBarButton.isEnabled = !newText.isEmpty
        }
        return true
    }
}
