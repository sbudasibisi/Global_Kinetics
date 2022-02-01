//
//  Service.swift
//  Global_Kinetics
//
//  Created by Sibusiso Sibisi on 2022/01/30.
//

import UIKit

class SearchQuestionsRepository: NSObject {
    
    var questionsDelegate: SearchQuestionsDelegate!
        
    func  fetchSearchedItems(searchParameter: String){//, completion: @escaping (Json4Swift_Base?, Error?)->()){
        let tag = "Swift3"
            let urlComponents = NSURLComponents(string: "https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&tagged="+tag+"&site=stackoverflow")
           // urlComponents?.queryItems = [URLQueryItem(name:"IncludedKeywords", value: searchParameter)]
            
            var urlRequest = URLRequest(url: (urlComponents?.url!)!)
            urlRequest.httpMethod = "GET"
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration).dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                
        
                guard let searchResponse = try? JSONDecoder().decode(BaseResponse.self, from: data!) else{
                    
                  
                    
                    if let error = error{
                     //   completion(nil, error)
                        print(error.localizedDescription)
                    }
                    return
                }
              //  completion(searchResponse,nil)
                print(String(data: data!, encoding: String.Encoding.utf8)!)
                if let items = searchResponse.items{
                    self.questionsDelegate.questionsReceived(items: items)

                }
            })
            session.resume()
        }

}
