//
//  NetworkLayer.swift
//  PrimeiroAppNetworkCurso
//
//  Created by Weverton on 19/06/25.
//

import Foundation

protocol NetworkLayer {
    func request<T>(with endpoint: Endpoint, decodeType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable
}
