//
//  HomeViewController.swift
//  PrimeiroAppNetworkCurso
//
//  Created by Weverton on 14/06/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        self.viewModel.fetchRequest()
    }


}

