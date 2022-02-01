

import UIKit

class ViewQuestionViewModel: NSObject {
    
    var item: Items!
    init(item: Items){
        self.item  = item
    }
    
    func title() -> String{
        return item.title ?? ""
    }
    
    func body() -> NSAttributedString{
        if let body = item.body{
            
            guard let data = body.data(using: .utf8) else { return NSAttributedString(string: "") }
                do {
                    return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
                } catch {
                    return NSAttributedString(string: "")
                }
            }
            
            return NSAttributedString(string: "")
    }
    
    func askDate() -> String {
        if let date = item.creation_date{
            return "asked \(date)"
        }
        return ""
    }
    
    func ownerName() -> String{
        if let ownerName = item.owner?.display_name{
            return ownerName
        }
        return ""
    }
    
    func ownerProfileReputation() -> String{
        if let reputation = item.owner?.reputation{
            return "\(reputation)"
        }
        return ""
    }
    
    func ownerProfilePic() -> String{
        
        if let image = item.owner?.profile_image{
            return image
        }
        return ""
    }
    
    func tags() -> String{
        if let tags = item.tags{
            return (tags.map{String($0)}).joined(separator: ", ")
        }
        return ""
    }

}
