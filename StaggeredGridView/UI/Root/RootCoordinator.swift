import UIKit

final class RootCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = RootViewModel()
        let viewController = RootViewController(viewModel: viewModel)
        viewModel.coordinator = self
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func showStaggeredGridView() {
        staggeredGridCoordinator = StaggeredGridCoordinator(navigationController: navigationController)
        staggeredGridCoordinator?.start()
    }
    
    private var staggeredGridCoordinator: StaggeredGridCoordinator?
}
