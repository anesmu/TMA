//
//  HomeViewController.swift
//  TMA
//
//  Created by Antonio Espino Muñoz on 2/3/22.
//

import UIKit

class HomeViewController: UIViewController {

    private var router = HomeRouter()
    private var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.bind(view: self, router: router)
    }
}
