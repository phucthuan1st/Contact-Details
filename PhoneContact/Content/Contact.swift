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

    // fetch contact từ hệ thống
    init() {
        fetchContacts()
    }
    private func fetchContacts() {
        // 1.
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                return
            }
            if granted {
                // 2.
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactEmailAddressesKey, CNContactOrganizationNameKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    // 3.
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                        self.contacts.append(contact)
                    })
                } catch let error {
                    print("Failed to enumerate contact", error)
                }
            } else {
                print("access denied")
            }
        }
    }

    // access đến các contacts có trong hệ thống
    public func getSystemContact() -> [CNContact] {
        return contacts
    }
}


