//
//  NetworkError.swift
//  PrimeiroAppNetworkCurso
//
//  Created by Weverton on 19/06/25.
//

import Foundation

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
