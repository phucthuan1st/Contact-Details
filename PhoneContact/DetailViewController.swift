//
//  DetailViewController.swift
//  PhoneContact
//
//  Created by MacMini01 on 10/06/2022.
//

import UIKit
import Contacts

class DetailViewController: UIViewController {

    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var contactEmail: UILabel!
    @IBOutlet weak var contactOrganization: UILabel!
    
    var contact:CNContact?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadContact()
    }
    
    func loadContact() {
        contactName.text = contact!.givenName + " " + contact!.familyName
        
        let email = contact!.emailAddresses[0].value
        contactEmail.text = email as String
        
        let phone = contact!.phoneNumbers[0].value
        contactNumber.text = phone.stringValue
        
        contactOrganization.text = contact!.organizationName
    }

}
