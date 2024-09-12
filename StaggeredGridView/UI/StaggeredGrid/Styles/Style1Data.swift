import Foundation

struct Style1Data: SectionStyleData {
    var style: LayoutSections
    
    init() {
        self.style = .style1(RandomColoredView(),
                             RandomColoredView(),
                             RandomColoredView(),
                             RandomColoredView(),
                             RandomColoredView(),
                             RandomColoredView())
    }
}

