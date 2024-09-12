import Foundation

struct Style3Data: SectionStyleData {
    var style: LayoutSections
    
    init() {
        self.style = .style3(RandomColoredView(),
                             RandomColoredView())
    }
}

