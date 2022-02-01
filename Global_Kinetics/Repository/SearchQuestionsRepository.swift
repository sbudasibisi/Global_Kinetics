
import UIKit

class SearchQuestionsRepository: NSObject {
        
    func  fetchSearchedItems(searchParameter: String, completion: @escaping (BaseResponse?, Error?)->()){
      
            let urlComponents = NSURLComponents(string: "https://api.stackexchange.com/2.3/questions")
            urlComponents?.queryItems = [URLQueryItem(name:"order", value: "desc"), URLQueryItem(name:"sort", value: "activity"),URLQueryItem(name:"tagged", value: searchParameter),URLQueryItem(name:"site", value: "stackoverflow"),URLQueryItem(name:"filter", value: "withbody"),URLQueryItem(name:"pagesize", value: "20")]
            
            var urlRequest = URLRequest(url: (urlComponents?.url!)!)
            urlRequest.httpMethod = "GET"
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration).dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                guard let searchResponse = try? JSONDecoder().decode(BaseResponse.self, from: data!) else{
                    if let error = error{
                        completion(nil, error)
                        print(error.localizedDescription)
                    }
                    return
                }
                completion(searchResponse,nil)
                print(String(data: data!, encoding: String.Encoding.utf8)!)
            })
            session.resume()
        }

}
