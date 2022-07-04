//
//  ViewController.swift
//  PhoneContact
//
//  Created by MacMini01 on 09/06/2022.
//
import Contacts
import UIKit

class ListViewController: UIViewController {
    
    // properties
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var contactList = [CNContact]()
    var storedContactList = [CNContact]()
    
    // MARK: load controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initContactsList()
        initSearchBar()
        drawTable()
    }
    
}

extension ListViewController : UITableViewDataSource, UITableViewDelegate {
    
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
			self?.storedContactList = data
            self?.tableView.reloadData()
		}

        contactList = storedContactList
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
        
        self.hideKeyboard()
        
        let selectedContact = contactList[indexPath.section]
        print("Select: \(selectedContact.givenName) \(selectedContact.familyName)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailView") as! DetailViewController
        
        detailViewController.contact = selectedContact
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
        // deselect row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ListViewController : UISearchBarDelegate {
    //MARK: Search Bar
    func initSearchBar() {
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text!.isEmpty {
            contactList = storedContactList
            self.searchBar.showsCancelButton = false
        }
        else {
            self.searchBar.setShowsCancelButton(true, animated: true)
            contactList = storedContactList.filter{($0.givenName + " " + $0.familyName).uppercased().contains(searchBar.text!.uppercased())}
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.hideKeyboard()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.hideKeyboard()
        self.searchBar.showsCancelButton = false
        self.searchBar.text = ""
        
        contactList = storedContactList
        tableView.reloadData()
    }
    
    func hideKeyboard() {
        self.searchBar.endEditing(true)
    }
    
}
