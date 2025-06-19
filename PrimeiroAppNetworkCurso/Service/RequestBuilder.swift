//
//  RequestBuilder.swift
//  PrimeiroAppNetworkCurso
//
//  Created by Weverton on 19/06/25.
//

import Foundation

protocol RequestBuilder {
    func buildRequest(with endpoint: Endpoint, url: URL) -> URLRequest
}
