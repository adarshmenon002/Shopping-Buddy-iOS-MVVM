
import Foundation
import Alamofire


protocol HomeServiceProtocol {
    func getHomeData(completion: @escaping (_ success: Bool, _ results: HomeDataResponse?, _ error: String?) -> ())
}

class HomeService: HomeServiceProtocol {
    func getHomeData(completion: @escaping (Bool, HomeDataResponse?, String?) -> ()) {
        
        AF.request("https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0", method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result{
                case .success(let json):
                    print(json)
                    guard let data = response.data else { return }
                    do{
                        let decoder = JSONDecoder()
                        let homeDataRes = try decoder.decode(HomeDataResponse.self, from: data)
                        print("home data is \(homeDataRes.homeData)")
                        completion(true, homeDataRes, nil)
                    
                    }catch let error {
                        completion(false, nil, "Error: Trying to parse homeDataRes to model")
                    }
                    
                case .failure(let error):
                    completion(false, nil, "Error: homeDataRes GET Request failed")
                }
            }
        
    }
}
