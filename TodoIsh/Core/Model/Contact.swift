//
//  Contact.swift
//  TodoIsh
//
//  Created by Jhon Jaiver Lopez on 12/9/18.
//  Copyright © 2018 Jhon Jaiver Lopez. All rights reserved.
//

import Foundation

struct Contact {
    let name: String
    let phoneNumber: String
}

extension Contact {
    static func fetchAllContacts(completion: (Result) -> Void) {
        
        let contacts = [Contact(name: "Jhon", phoneNumber: "1234567"),
                        Contact(name: "Juan", phoneNumber: "543211"),
                        Contact(name: "Jack", phoneNumber: "09877657645")].map({ (contactInfo) -> CellType in
            return .contact(contactInfo)
        })
        
        completion(.data(contacts))
        
//        completion(.noData)
    }
}
