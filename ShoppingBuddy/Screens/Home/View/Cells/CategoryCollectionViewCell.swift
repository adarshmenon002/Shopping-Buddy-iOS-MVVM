import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properities
    
    static let cellIdentifier = "CategoryCollectionViewCell"
    
    var cellData : Category? {
        didSet {
            guard let cellData = cellData else {
                return
            }
            categoryImgView.sd_setImage(with: URL(string: cellData.imageUrl ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            categoryLabel.text = cellData.name
        }
    }
    
    lazy var categoryImgView : UIImageView = {
        let catImg = UIImageView(frame: CGRect(x: 50, y: 0, width: 45, height: 45))
        catImg.translatesAutoresizingMaskIntoConstraints = true
        catImg.contentMode = .scaleAspectFit
        catImg.clipsToBounds = true
        catImg.layer.cornerRadius = 3
        return catImg
    }()
    
    lazy var categoryLabel : UILabel = {
        let catLabel = UILabel()
        catLabel.translatesAutoresizingMaskIntoConstraints = false
        catLabel.font = UIFont.systemFont(ofSize: 11,weight: .bold)
        catLabel.numberOfLines = 2
        catLabel.textAlignment = .center
        catLabel.textColor = .label.withAlphaComponent(0.8)
        return catLabel
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
        configureConstrains()
    }
    
    func configureCell(){
        
        let roundedView = UIView(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
        roundedView.backgroundColor = UIColor(hexString: "faf0ef")
        roundedView.layer.cornerRadius = roundedView.frame.size.width / 2
        roundedView.clipsToBounds = true
       
        self.backgroundColor = .clear
        addSubview(roundedView)
        roundedView.addSubview(categoryImgView)
        addSubview(categoryLabel)
        categoryImgView.center = roundedView.convert(roundedView.center, from:roundedView.superview)
    }
    
    func configureConstrains(){
        NSLayoutConstraint.activate([
            categoryImgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            categoryImgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            categoryImgView.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            categoryImgView.heightAnchor.constraint(equalToConstant: 45),
            
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            categoryLabel.topAnchor.constraint(equalTo: categoryImgView.bottomAnchor, constant: 3),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
