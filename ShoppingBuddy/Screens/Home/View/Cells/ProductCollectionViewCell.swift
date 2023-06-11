import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "ProductCollectionViewCell"
    
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var actualPriceLabel: UILabel!
    @IBOutlet weak var deliveryImage: UIImageView!
    @IBOutlet weak var offerPriceLabel: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var stripImage: UIImageView!
    @IBOutlet weak var percentageOffLabel: UILabel!
    
    var cellData : Product? {
        didSet {
            guard let cellData = cellData else {
                return
            }
            let percentage = calculatePercentage(actualPriceStr: cellData.actualPrice, offerPriceStr: cellData.offerPrice)
            deliveryImage.isHidden = cellData.isExpress ?? false
            productImage.sd_setImage(with: URL(string: cellData.imageUrl ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: cellData.actualPrice ?? "")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
            
            percentageOffLabel.isHidden = percentage == 0
            stripImage.isHidden = percentage == 0
            actualPriceLabel.isHidden = percentage == 0
            percentageOffLabel.text = "\(percentage)% OFF"
            actualPriceLabel.attributedText = attributeString
            
            offerPriceLabel.text = cellData.offerPrice
            titleLbl.text = cellData.name
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func addToCartTapped(_ sender: UIButton) {
    }
    
    func calculatePercentage(actualPriceStr: String?, offerPriceStr: String?) -> Int {
        let actualPrice = Double(cleanPriceValue(value: actualPriceStr ?? "0")) ?? 0
        let offerPrice = Double(cleanPriceValue(value: offerPriceStr ?? "0")) ?? 0
        if offerPrice > 0 {
            let percentageOff = Int((1 - (offerPrice / actualPrice)) * 100)
            return percentageOff
        } else if actualPrice == offerPrice {
            return 0
        } else {
            return 0
        }
    }
    
    func cleanPriceValue(value :String?) -> String{
        
        let priceWithoutRupeeSign = value?.replacingOccurrences(of: "₹", with: "")
        let result = priceWithoutRupeeSign?.replacingOccurrences(of: " ", with: "")
        return result!
    }
}
