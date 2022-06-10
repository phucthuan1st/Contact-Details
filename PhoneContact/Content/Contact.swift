//
//  Contact.swift
//  PhoneContact
//
//  Created by MacMini01 on 09/06/2022.
//

import Foundation
import Contacts

class Contacts {
    // fetch contact từ hệ thống
    init() {
    }
	func fetchContacts(_ completion: @escaping ([CNContact]) ->()) {
        // 1.
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
				completion([])
                return
            }
            if granted {
                // 2.
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactEmailAddressesKey, CNContactOrganizationNameKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    // 3.
					var contacts: [CNContact] = []
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                        contacts.append(contact)
                    })
					completion(contacts)
                } catch let error {
                    print("Failed to enumerate contact", error)
					completion([])
                }
            } else {
                print("access denied")
				completion([])
            }
        }
    }
}


