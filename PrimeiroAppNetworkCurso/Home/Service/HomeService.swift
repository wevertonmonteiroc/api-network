//
//  HomeService.swift
//  PrimeiroAppNetworkCurso
//
//  Created by Weverton on 14/06/25.
//

import UIKit

import UIKit

class HomeService: NSObject {
    
    public func getPersonList(completion: @escaping (Result<[Person],NetworkError>) -> Void) {
        let urlString: String = "1328d142-9a04-44a2-861f-510b44b8ba92"
        let endpoint = Endpoint(url: urlString, method: .get, headers: nil, parameters: nil)

        ServiceManager.shared.request2(with: endpoint, decodeType: PersonList.self) { result in
            switch result {
            case .success(let success):
                completion(.success(success.person))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
