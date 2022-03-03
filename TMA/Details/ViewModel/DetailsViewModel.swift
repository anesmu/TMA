//
//  DetailsViewModel.swift
//  TMA
//
//  Created by Antonio Espino Muñoz on 3/3/22.
//

import Foundation
import RxSwift

class DetailsViewModel {
    private weak var view: DetailsViewController?
    private var router: DetailsRouter?
    private var managerServices = ManagerServices()

    func bind(view: DetailsViewController, router: DetailsRouter) {
        self.view = view
        self.router = router

        // Binding the router with the view
        self.router?.setSourceView(view)
    }

    func getMovieData(movieID: String) -> Observable<MovieDetails> {
        return managerServices.getDetailsMovie(movieID: movieID)
    }
}
