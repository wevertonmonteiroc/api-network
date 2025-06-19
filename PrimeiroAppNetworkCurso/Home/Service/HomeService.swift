//
//  HomeService.swift
//  PrimeiroAppNetworkCurso
//
//  Created by Weverton on 14/06/25.
//

import UIKit

import UIKit

enum NetworkError: Error {
    case invalidURL(url: String)
    case noData
    case invalidResponse
    case decodingError(Error)
    case networkFailure(Error)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL(let url):
            return "URL inválida -> \(url)"
        case .noData:
            return "Nenhum dado recebido da api"
        case .invalidResponse:
            return "Resposta inválida da api"
        case .decodingError(let error):
            return "Erro ao decodificar os dados: \(error.localizedDescription)"
        case .networkFailure(let error):
            return "Erro na rede: \(error.localizedDescription)"
        }
    }
}

class HomeService: NSObject {
    
    public func getPersonList(completion: @escaping (Result<[Person],NetworkError>) -> Void) {
        let urlString: String = "https://run.mocky.io/v3/1328d142-9a04-44a2-861f-510b44b8ba92"
        ServiceManager.shared.request(with: urlString, method: .post, decodeType: PersonList.self) { result in
            switch result {
            case .success(let success):
                completion(.success(success.person))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
