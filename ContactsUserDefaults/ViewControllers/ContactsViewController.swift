//
//  ContactsViewController.swift
//  ContactsUserDefaults
//
//  Created by Vsevolod Lashin on 19.05.2023.
//

import UIKit

protocol NewContactViewControllerDelegate: AnyObject {
    func add(contact: Contact)
}

final class ContactsViewController: UITableViewController {
    
    private var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newContactVC = segue.destination as? NewContactViewController else { return }
        newContactVC.delegate = self
    }
}

// MARK: - UITAbleViewDataSource
extension ContactsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        let contact = contacts[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = contact.fullName
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ContactsViewController {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - NewContactViewControllerDelegate
extension ContactsViewController: NewContactViewControllerDelegate {
    func add(contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
}
