//
//  PersonList.swift
//  PrimeiroAppNetworkCurso
//
//  Created by Weverton on 15/06/25.
//

import Foundation

struct PersonList: Codable {
    var persons: [Person]
}

struct Person: Codable {
    var name: String
    var lastName: String
    var phone: String
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case lastName = "sobrenome"
        case phone = "telefone"
    }
}
