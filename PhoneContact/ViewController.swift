//
//  ViewController.swift
//  PhoneContact
//
//  Created by MacMini01 on 09/06/2022.
//
import Contacts
import ContactsUI
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contactList = [CNContact]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Test"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showContactList()
    }
    
    func showContactList() {
        let contact = Contacts()
        contactList = contact.getSystemContact()
        for contact in contactList {
            print(contact)
        }
    }
    
    @IBAction func tapAddButton(_ sender: Any) {
        print("You tap add button")
    }
    
    
    @IBAction func tapGroupButton(_ sender: Any) {
        print("You tap group button")
    }
}

/*
 * - Contact fetch không đầy đủ (một số field bị not fetched) :<
 * - Làm sao để load các thông tin lên table view?
 * - Làm sao để hiện thị thông tin của item đã pick lên một view controller mới?
 */
