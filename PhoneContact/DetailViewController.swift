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
    
    var contact:CNContact?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadContact()
    }
    
    func loadContact() {
        contactName.text = contact!.givenName + " " + contact!.familyName

        if (contact!.emailAddresses.count != 0) {
            let email = contact!.emailAddresses[0].value
            contactEmail.text = email as String
        }
        else {
            contactEmail.text = ""
        }

        if (contact!.phoneNumbers.count != 0) {
            let phone = contact!.phoneNumbers[0].value
            contactNumber.text = phone.stringValue
        }
        else {
            contactNumber.text = ""
        }

        contactOrganization.text = contact!.organizationName
    }

}
