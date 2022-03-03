//
//  HomeViewModel.swift
//  TMA
//
//  Created by Antonio Espino Muñoz on 2/3/22.
//

import Foundation
import RxSwift

class HomeViewModel {
    private weak var view: HomeViewController?
    private var router: HomeRouter?
    private var managerServices = ManagerServices()


    func bind(view: HomeViewController, router: HomeRouter) {
        self.view = view
        self.router = router

        self.router?.setSourceView(view)
    }

    func getListMovies() -> Observable<[Movie]> {
        return managerServices.getPopularMovies()
    }
}
