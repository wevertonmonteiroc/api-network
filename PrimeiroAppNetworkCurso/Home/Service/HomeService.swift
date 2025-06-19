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
    
    public func getPersonList(completion: @escaping (Result<PersonList,NetworkError>) -> Void) {
        let urlString: String = "https://run.mocky.io/v3/1328d142-9a04-44a2-861f-510b44b8ba92"
        
        guard let url: URL = URL(string: urlString) else {
            completion(.failure(.invalidURL(url: urlString)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error {
                DispatchQueue.main.async {
                    completion(.failure(.networkFailure(error)))
                }
                return
            }
            
            guard let data else {
                DispatchQueue.main.async {
                    completion(.failure(.noData))
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }
            
            do {
                let personList: PersonList = try JSONDecoder().decode(PersonList.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(personList))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        task.resume()
    }
}
