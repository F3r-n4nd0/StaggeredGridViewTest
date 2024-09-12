import UIKit
import Combine

final class StaggeredGridViewModel {
    weak var coordinator: StaggeredGridCoordinator?
    
    var updateData = PassthroughSubject<Void, Never>()
    var sections: [SectionStyleData]
    
    init() {
        self.sections = Self.createMockData()
    }
    
    func viewWillAppear() {
        updateData.send()
    }
    
    private static func createMockData() -> [SectionStyleData]  {
        [Style1Data(),
         Style2Data(),
         Style3Data()]
    }
    
}







