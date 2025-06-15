//
//  HomeViewModel.swift
//  PrimeiroAppNetworkCurso
//
//  Created by Weverton on 14/06/25.
//

import UIKit

class HomeViewModel: NSObject {
    
    var services: HomeService = HomeService()
    
    init(services: HomeService = HomeService()) {
        self.services = services
    }

    public func fetchRequest() {
        self.services.getPersonList { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure.errorDescription ?? "")
            }
        }
    }
}
