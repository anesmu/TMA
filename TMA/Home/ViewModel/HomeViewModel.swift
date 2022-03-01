//
//  HomeViewModel.swift
//  TMA
//
//  Created by Antonio Espino Muñoz on 2/3/22.
//

import Foundation

class HomeViewModel {
    private weak var view: HomeViewController?
    private var router: HomeRouter?


    func bind(view: HomeViewController, router: HomeRouter) {
        self.view = view
        self.router = router

        // Binding the router with the view
        self.router?.setSourceView(view)
    }
}
