import Foundation

class HomeViewModel: NSObject {
    private var homeService: HomeServiceProtocol
    
    var reloadCollectionView: (() -> Void)?
        
    var homeSectionArray = [HomeSection]() {
        didSet {
            reloadCollectionView?()
        }
    }

    init(homeService: HomeServiceProtocol = HomeService()) {
        self.homeService = homeService
    }
    
    func getHomeData() {
        homeService.getHomeData { success, model, error in
            if success, let homeResponse = model {
                self.homeSectionArray = homeResponse.homeData
            } else {
                print(error!)
            }
        }
    }
    
}
