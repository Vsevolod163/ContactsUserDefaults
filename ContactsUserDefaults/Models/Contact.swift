//
//  Contact.swift
//  ContactsUserDefaults
//
//  Created by Vsevolod Lashin on 19.05.2023.
//

import Foundation

struct Contact: Codable {
    let firstName: String
    let lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
