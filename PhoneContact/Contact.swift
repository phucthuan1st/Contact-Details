//
//  Contact.swift
//  PhoneContact
//
//  Created by MacMini01 on 09/06/2022.
//

import Foundation
import Contacts

class Contacts {
    var contacts = [CNContact]()

    init() {
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        let request = CNContactFetchRequest(keysToFetch: keys)
        let contactStore = CNContactStore()
        
        do {
            try contactStore.enumerateContacts(with: request) {
              (contact, stop) in
              // Array containing all unified contacts from everywhere
                self.contacts.append(contact)
            }
        }
        catch {
            print("unable to fetch contacts")
        }
    }

    public func getSystemContact() -> [CNContact] {
        return contacts
    }
}


