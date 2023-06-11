
struct Product: Codable{
    
    let id :Int
    let name : String?
    let imageUrl : String?
    let actualPrice:String?
    let offerPrice:String?
    let offer:Int
    let isExpress:Bool?
    
    
    private enum CodingKeys: String, CodingKey{
        
        case id
        case name
        case imageUrl = "image"
        case actualPrice = "actual_price"
        case offerPrice = "offer_price"
        case offer
        case isExpress = "is_express"
        
    }
}
