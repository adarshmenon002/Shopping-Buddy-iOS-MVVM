
import UIKit
import SDWebImage

class BannerCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properities
    
    static let cellIdentifier = "BannerCollectionViewCell"
    
    var cellData : Banner? {
        didSet {
            guard let cellData = cellData else {return}
            bannerImage.sd_setImage(with: URL(string: cellData.imageUrl ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            bannerImage.contentMode = .scaleAspectFit
        }
    }
        
    let bannerImage : UIImageView = {
        let bI = UIImageView()
        bI.translatesAutoresizingMaskIntoConstraints = false
        bI.backgroundColor = .systemBackground
        bI.clipsToBounds = true
        bI.contentMode = .scaleAspectFill
        bI.layer.cornerRadius = 2
        return bI
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func configure(){
        contentView.backgroundColor = .clear
        addSubview(bannerImage)
        bannerImage.setUp(to: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
