import UIKit
import Alamofire

class HomeViewController: UIViewController {
   
    @IBOutlet weak var masterCollectionView: UICollectionView!
    
    lazy var viewModel = {
        HomeViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        configureCompositionalLayout()
        initViewModel()
        
    }
    func initViewModel() {
        
        viewModel.getHomeData()
        
        viewModel.reloadCollectionView = { [weak self] in
            
            self?.masterCollectionView.reloadData()
        }
    }
    
    func setUpCollectionView(){
        
        masterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        masterCollectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.cellIdentifier)
        masterCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.cellIdentifier)
        masterCollectionView.register(UINib.init(nibName: ProductCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.cellIdentifier)
        
        
        masterCollectionView.backgroundColor = .systemBackground
        view.backgroundColor = .systemBackground
        
    }
    
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            let type = self.viewModel.homeSectionArray[sectionIndex].type
            switch type {
            case "category" :
                return LayoutUtil.categorySection()
            case "banners" :
                return LayoutUtil.bannerSection()
            case "products" :
                return LayoutUtil.productListSection()
            default:
                return LayoutUtil.categorySection()
            }
        }
        masterCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
}


extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.homeSectionArray[section].values.count

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.homeSectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = viewModel.homeSectionArray[indexPath.section].type
        switch type {
            
        case "category" :
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.cellIdentifier, for: indexPath) as? CategoryCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = viewModel.homeSectionArray[indexPath.section].values[indexPath.row] as? Category
                         return cell
    
            
        case "banners" :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.cellIdentifier, for: indexPath) as? BannerCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = viewModel.homeSectionArray[indexPath.section].values[indexPath.row] as? Banner
             return cell
            
        case "products" :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.cellIdentifier, for: indexPath) as? ProductCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = viewModel.homeSectionArray[indexPath.section].values[indexPath.row] as? Product
             return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.cellIdentifier, for: indexPath) as? CategoryCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = viewModel.homeSectionArray[indexPath.section].values[indexPath.row] as? Category
            return cell
        }
    }
}
