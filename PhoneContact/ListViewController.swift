//
//  ViewController.swift
//  PhoneContact
//
//  Created by MacMini01 on 09/06/2022.
//
import Contacts
import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // properties
    @IBOutlet weak var tableView: UITableView!
    var contactList = [CNContact]()
    
    // MARK: config table view ---------------
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        
        cell.textLabel?.text = contactList[indexPath.section].givenName + " " + contactList[indexPath.section].familyName
        
        return cell
    }
    
    func drawTable() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: get data source
    func initContactsList() {
        let contact = Contacts()
		contact.fetchContacts { [weak self] data in
			self?.contactList = data
			self?.tableView.reloadData()
		}
    }
    
    // MARK: Button/touching manage
    @IBAction func tapAddButton(_ sender: Any) {
        print("You tap add button")
    }
    
    @IBAction func tapGroupButton(_ sender: Any) {
        print("You tap group button")
    }
    
    // MARK: Navigation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedContact = contactList[indexPath.section]
        print("Select: \(selectedContact.givenName) \(selectedContact.familyName)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailView") as! DetailViewController
        
        detailViewController.contact = selectedContact
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
        // deselect row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: load controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initContactsList()
        drawTable()
    }
}
