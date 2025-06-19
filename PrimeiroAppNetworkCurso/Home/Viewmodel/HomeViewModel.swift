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
        service.getPersonList { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let success):
                personList = success.person
                delegate?.sucess()
            case .failure(let failure):
                delegate?.error(message: failure.errorDescription ?? "")
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return personList.count
    }
    
    func loadCurrentPerson(indexPath: IndexPath) -> Person {
        return personList[indexPath.row]
    }
}
