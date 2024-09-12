import UIKit

final class StaggeredGridViewController: UIViewController {
    
    init(viewModel: StaggeredGridViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureComponentes()
    }
    
    private var viewModel: StaggeredGridViewModel
    
    private func configureView() {
        view.backgroundColor = .red
    }
    
    private func configureComponentes() {
    }
}

