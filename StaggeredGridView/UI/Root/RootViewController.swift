import UIKit

final class RootViewController: UIViewController {
    
    init(viewModel: RootViewModel) {
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
    
    
    
    private var viewModel: RootViewModel
    
    private lazy var buttonShowStaggerGrid: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Stagger Grid", for: .normal)
        button.addTarget(self, action: #selector(buttonShowStaggerGridTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func buttonShowStaggerGridTapped() {
        viewModel.showStaggeredGrid()
    }
    
    private func configureView() {
        view.backgroundColor = .white
    }
    
    private func configureComponentes() {
        view.addSubview(buttonShowStaggerGrid)
        NSLayoutConstraint.activate([
            buttonShowStaggerGrid.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonShowStaggerGrid.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

