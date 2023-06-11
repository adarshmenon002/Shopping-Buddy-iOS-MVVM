
struct HomeDataResponse : Codable{
    
    let status : Bool
    let homeData : [HomeSection]
    
    private enum CodingKeys: String, CodingKey{
        
        case status
        case homeData = "homeData"
    }
}
