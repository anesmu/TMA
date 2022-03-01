//
//  HomeRouter.swift
//  TMA
//
//  Created by Antonio Espino Muñoz on 2/3/22.
//

import Foundation
import UIKit

class HomeRouter {
    var viewController: UIViewController {
        return makeViewController()
    }

    private var sourceView: UIViewController?

    private func makeViewController() -> UIViewController {
        let viewController = HomeViewController(nibName: "HomeViewController",
                                                bundle: Bundle.main)
        return viewController
    }

    func setSourceView(_ sourceView: UIViewController?) {
        guard let sourceView = sourceView else { fatalError("Fatal error") }

        self.sourceView = sourceView
    }
}
