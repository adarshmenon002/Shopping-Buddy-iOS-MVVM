import Foundation


struct HomeSection : Codable{
    
    let type:String?
    let values:[Any]
    
    private enum CodingKeys: String, CodingKey{
        
        case type
        case values
    }
    
    init(from decoder: Decoder) throws {
            let container = try? decoder.container(keyedBy: CodingKeys.self)
            type = try container?.decodeIfPresent(String.self, forKey: .type) ?? ""
        switch type {
        case "category":
            values = try (container?.decode([Category].self, forKey: .values) as? [Category])!
            break
        case "banners":
            values = try (container?.decode([Banner].self, forKey: .values) as? [Banner])!
            break
        case "products":
            values = try (container?.decode([Product].self, forKey: .values) as? [Product])!
            break
        default:
            values = []
            break
        }

    }
    
    func encode(to encoder: Encoder) throws {}

}
