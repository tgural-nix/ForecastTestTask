//
//  ListViewCoordinator.swift
//  App
//
//

import UIKit

class ListViewCoordinator {

    weak var navigationController: UINavigationController?
    private weak var viewController: ListViewController?

    public func start(window: UIWindow) {
        let viewModel = ListViewModel()

        let viewController = ListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        viewModel.showDetail = {
            DetailViewCoordinator().start(navigationController: navigationController, forecastItem: $0)
        }
        window.rootViewController = navigationController

        self.navigationController = navigationController
        self.viewController = viewController
    }
}
