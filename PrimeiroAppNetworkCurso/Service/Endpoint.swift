//
//  Endpoint.swift
//  PrimeiroAppNetworkCurso
//
//  Created by Weverton on 19/06/25.
//

import Foundation

struct Endpoint {
    let url: String
    let method: HTTPMethod
    let headers: [String: String]?
    let parameters: Parameters?
}

enum Parameters {
    case dictionary([String: Any])
    case encodable(Encodable)
}
