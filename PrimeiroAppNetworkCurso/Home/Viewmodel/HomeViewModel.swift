//
//  HomeViewModel.swift
//  PrimeiroAppNetworkCurso
//
//  Created by Weverton on 14/06/25.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    func sucess()
    func error(message: String)
}

class HomeViewModel: NSObject {
    
    var service: HomeService = HomeService()
    var personList: [Person] = []
    private weak var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol?) {
        self.delegate = delegate
    }


    public func fetchRequest() {
        self.service.getPersonList { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure.errorDescription ?? "")
            }
        }
    }
}
