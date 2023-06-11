

struct Category: Codable{
    
    let id :Int
    let name : String?
    let imageUrl : String?
    
    
    private enum CodingKeys: String, CodingKey{
        
        case id
        case name
        case imageUrl = "image_url"
        
    }
}
