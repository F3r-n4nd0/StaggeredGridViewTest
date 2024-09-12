import Foundation

final class RootViewModel {
    weak var coordinator: RootCoordinator?
    
    func showStaggeredGrid() {
        coordinator?.showStaggeredGridView()
    }
}
