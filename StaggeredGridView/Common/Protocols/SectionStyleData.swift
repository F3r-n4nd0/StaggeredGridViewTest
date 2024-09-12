import UIKit

protocol SectionStyleData {
    var style: LayoutSections { get }
    var layout: NSCollectionLayoutSection { get }
    var numberOfItemsInSection: Int { get }
    func viewByIndex(_ index: Int) -> UIView
}

extension SectionStyleData {
    var layout: NSCollectionLayoutSection {
        style.sectionLayoutGroup
    }
    var numberOfItemsInSection: Int {
        style.numberRows
    }
    func viewByIndex(_ index: Int) -> UIView {
        style.viewByIndex(index)
    }
}
