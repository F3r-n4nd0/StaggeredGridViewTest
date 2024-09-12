import Foundation

struct Style2Data: SectionStyleData {
    var style: LayoutSections
    
    init() {
        self.style = .style2(RandomColoredView(),
                             RandomColoredView(),
                             RandomColoredView(),
                             RandomColoredView())
    }
}

