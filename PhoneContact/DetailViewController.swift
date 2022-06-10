//
//  DetailViewController.swift
//  PhoneContact
//
//  Created by MacMini01 on 10/06/2022.
//

import UIKit
import Contacts

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var infoField = [String]()
    var contact:CNContact?
    @IBOutlet weak var infoTable: UITableView!
    @IBOutlet weak var contactName: UILabel!
    
    // MARK: config table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return infoField.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        cell.textLabel?.text = infoField[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func loadTable() {
        infoTable.dataSource = self
        infoTable.delegate = self
    }
    
    // MARK: load data for table view
    func loadContact() {
        contactName.text = contact!.givenName + " " + contact!.familyName
        
        if (contact!.emailAddresses.count != 0) {
            infoField.append(contact!.emailAddresses[0].value as String)
        }
        if (contact!.phoneNumbers.count != 0) {
            infoField.append(contact!.phoneNumbers[0].value.stringValue as String)
        }
        
        infoField.append(contact!.organizationName)
        print(infoField)
    }
    
    // MARK: load UI
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContact()
        loadTable()
    }

}
