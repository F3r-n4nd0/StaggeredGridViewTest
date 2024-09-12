import UIKit

enum LayoutSections {
    case style1(UIView, UIView, UIView, UIView, UIView, UIView)
    case style2(UIView, UIView, UIView, UIView)
    case style3(UIView, UIView)
    
    var sectionLayoutGroup: NSCollectionLayoutSection {
        switch self {
        case .style1:
            Self.createSection1()
        case .style2:
            Self.createSection2()
        case .style3:
            Self.createSection3()
        }
    }
    
    var numberRows: Int {
        switch self {
        case .style1:
            6
        case .style2:
            4
        case .style3:
            2
        }
    }
    
    func viewByIndex(_ index: Int) -> UIView {
        switch self {
        case let .style1(main, sub1, sub2, sub3, sub4, sub5):
            switch index {
            case 0:
                main
            case 1:
                sub1
            case 2:
                sub2
            case 3:
                sub3
            case 4:
                sub4
            case 5:
                sub5
            default:
                main
            }
        case let .style2(sub1, sub2, sub3, sub4):
            switch index {
            case 0:
                sub1
            case 1:
                sub2
            case 2:
                sub3
            case 3:
                sub4
            default:
                sub1
            }
        case let .style3(sub1, sub2):
            switch index {
            case 0:
                sub1
            case 1:
                sub2
            default:
                sub1
            }
        }
    }
    
    private static func createSection1() -> NSCollectionLayoutSection {
        let containerGroup1SubGroup1Item1: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1)))
        containerGroup1SubGroup1Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let containerGroup1SubGroup1GroupItem: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)))
        containerGroup1SubGroup1GroupItem.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let containerGroup1SubGroup1Group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)), subitems: [containerGroup1SubGroup1GroupItem])
        
        let containerGroup1SubGroup1: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2/3)), subitems: [containerGroup1SubGroup1Item1, containerGroup1SubGroup1Group])
        
        let containerGroup1SubGroup2Item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
        containerGroup1SubGroup2Item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let containerGroup1SubGroup2: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [containerGroup1SubGroup2Item])
        
        let containerGroup1: NSCollectionLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [containerGroup1SubGroup1, containerGroup1SubGroup2])
        containerGroup1.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)

        let section = NSCollectionLayoutSection(group: containerGroup1)
        section.orthogonalScrollingBehavior = .none
        
        return section
    }
    
    private static func createSection2() -> NSCollectionLayoutSection {
        let containerGroup2Item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .fractionalHeight(1)))
        containerGroup2Item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let containerGroup2: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [containerGroup2Item])
        containerGroup2.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)

        let section = NSCollectionLayoutSection(group: containerGroup2)
        section.orthogonalScrollingBehavior = .none
        
        return section
    }
    
    
    private static func createSection3() -> NSCollectionLayoutSection {
        
        let containerGroup3Item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
        containerGroup3Item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let containerGroup3: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [containerGroup3Item])
        containerGroup3.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)

        let section = NSCollectionLayoutSection(group: containerGroup3)
        section.orthogonalScrollingBehavior = .none
        
        return section
    }
}
