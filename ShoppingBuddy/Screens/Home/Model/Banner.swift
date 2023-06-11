
struct Banner: Codable{
    
    let id :Int
    let imageUrl : String?
    
    
    private enum CodingKeys: String, CodingKey{
        
        case id
        case imageUrl = "banner_url"
        
    }
}
