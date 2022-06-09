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
    
    // access đến table view
    @IBOutlet weak var tableView: UITableView!
    
    var contactList = [CNContact]()
    
    // cái gì đó lạ lắm :< 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // đang không load được dữ liệu lên table cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Test"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showContactList()
    }
    
    // các contacts khi fetch đều bị thiếu nhiều trường
    func showContactList() {
        let contact = Contacts()
        contactList = contact.getSystemContact()
        for contact in contactList {
            print(contact)
        }
    }
    
    // chưa định nghĩa được do chưa biết navigation
    @IBAction func tapAddButton(_ sender: Any) {
        print("You tap add button")
    }
    
    // chưa biết xài filter :<
    @IBAction func tapGroupButton(_ sender: Any) {
        print("You tap group button")
    }
}

/*
 * Contact fetch không đầy đủ (một số field bị not fetched) :<
 * Làm sao để load các thông tin lên table view?
 * Làm sao để nhận biết đã pick 1 item trong table view?
 * Làm sao để hiện thị thông tin của item đã pick lên một view controller mới?
 * Làm sao để navigation giữa 2 view?
 */
