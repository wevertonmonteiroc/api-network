//
//  NetworkLayer.swift
//  PrimeiroAppNetworkCurso
//
//  Created by Weverton on 19/06/25.
//

import Foundation

protocol NetworkLayer {
    func request<T: Decodable>(with urlString: String, method: HTTPMethod, decodeType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
}
