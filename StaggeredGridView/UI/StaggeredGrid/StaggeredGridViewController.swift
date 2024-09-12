import UIKit
import Combine

final class StaggeredGridViewController: UIViewController {
    
    private var cancellables = Set<AnyCancellable>()
    
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
        listenToDataChanges()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
    }
    
    private var viewModel: StaggeredGridViewModel
    
    private var layout: UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            return self?.viewModel.sections[sectionIndex].layout
        }
    }
    
    private func listenToDataChanges() {
        viewModel.updateData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self else { return }
                self.collectionView.setCollectionViewLayout(layout, animated: true)
                self.collectionView.reloadData()
            }.store(in: &cancellables)
    }
    
    private lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        return collectionView
    }()
    
    private func configureView() {
        view.backgroundColor = .red
    }
    
    private func configureComponentes() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension StaggeredGridViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.sections[section].numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell
        let view = viewModel.sections[indexPath.section].viewByIndex(indexPath.row)
        cell.replaceEmbeddedView(with: view)
        return cell
    }
    
}
