import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    private var embeddedView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func replaceEmbeddedView(with newView: UIView) {
        embeddedView?.removeFromSuperview()
        embeddedView = newView
        contentView.addSubview(newView)
        newView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
