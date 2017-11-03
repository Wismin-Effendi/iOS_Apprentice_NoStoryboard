//
//  ChecklistViewController.swift
//  CheckLists
//
//  Created by Wismin Effendi on 11/2/17.
//  Copyright © 2017 Wismin Effendi. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Checklists"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChecklistItemCell.self, forCellReuseIdentifier: "ChecklistItem")
        
        items = [
            ChecklistItem(text: "Walk the dog", checked: false),
            ChecklistItem(text: "Brush my teeth", checked: true),
            ChecklistItem(text: "Learn iOS development", checked: true),
            ChecklistItem(text: "Soccer practice", checked: false),
            ChecklistItem(text: "Eat ice cream", checked: true)
        ]
    }

    @objc func addItem() {
        let controller = ItemDetailViewController ()
        controller.delegate = self
        
        show(controller, sender: nil)
    }
    
    func configureCheckmark(for cell: ChecklistItemCell, with item: ChecklistItem) {
        cell.checkLabel.text = item.checked ? "√" : ""
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        guard let itemCell = cell as? ChecklistItemCell else { return }
        itemCell.itemLabel.text = item.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath) as! ChecklistItemCell
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    
    // TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? ChecklistItemCell {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let controller = ItemDetailViewController()
        controller.delegate = self
        controller.itemToEdit = items[indexPath.row]
        
        show(controller, sender: tableView.cellForRow(at: indexPath))
    }
    

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? ItemDetailViewController {
            controller.delegate = self
            
            if sender != nil {
                print("Showing type of sender for segue")
                print(type(of: sender))
            } else {
                print("***  sender is nil")
            }
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                print("we are in edit item")
                controller.itemToEdit = items[indexPath.row]
            }
        }
    }
}

extension ChecklistViewController: ItemDetailViewControllerDelegate {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem) {
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem) {
        if let index = self.items.index(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}

