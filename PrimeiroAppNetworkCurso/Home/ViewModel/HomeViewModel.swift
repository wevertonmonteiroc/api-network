//
//  HomeViewModel.swift
//  PrimeiroAppNetworkCurso
//
//  Created by Weverton on 14/06/25.
//

import UIKit

class HomeViewModel: NSObject {
    
    public func fetchRequest() {
        let urlString: String = "https://run.mocky.io/v3/1328d142-9a04-44a2-861f-510b44b8ba92"
        
        guard let url: URL = URL(string: urlString) else {
            return print("URL inválido")
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error ) in
            if let error {
                print("Error: \(#function) detalhe do error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                return print("No data")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return print("No response")
            }
            
            do {
                try <#throwing expression#>
            } catch <#pattern#> {
                <#statements#>
            }
        }
        task.resume()
    }
}
