
import UIKit

class SearchQuestionsViewModel: NSObject {
    
    var items = [Items]()
    var searchQuestionsRepository = SearchQuestionsRepository()
    var searchQuestionsDelegate: SearchQuestionsDelegate!
    
    init(searchQuestionsDelegate: SearchQuestionsDelegate){
        self.searchQuestionsDelegate = searchQuestionsDelegate
    }
    
    func retrieveQuestionsForKeyword(keyword: String){
        searchQuestionsRepository.fetchSearchedItems(searchParameter: keyword, completion: handleQuestionsResponse)
    }
    
    private func handleQuestionsResponse(completion: BaseResponse?, error: Error?){
        if let responseItems = completion?.items{
            self.items = responseItems
            searchQuestionsDelegate.questionsReceived()
        }else{
            if error != nil{
                
            }
        }
    }
    
    func itemAtIndex(row: Int) -> Items{
        return items[row]
    }
    
    func numberOfRows() -> Int{
        return items.count
    }
    
    func title(row: Int) -> String{
        let item = items[row]
        return item.title ?? ""
    }
    
    func questionOwner(row: Int) -> String{
        let item = items[row]
        if let ownerName = item.owner?.display_name{
            return "asked by " + ownerName
        }
        return ""
    }
    
    func votes(row: Int) -> String{
        let item = items[row]
        guard let score = item.score else{
            return ""
        }
        return  "\(score) votes"
    }
    
    func views(row: Int) -> String{
        let item = items[row]
        guard let views = item.view_count else{
            return ""
        }
        return  "\(views) views"
    }
    
    func answers(row: Int) -> String{
        let item = items[row]
        guard let answers = item.answer_count else{
            return ""
        }
        return  "\(answers) answers"
    }
    
    func answered(row: Int) -> Bool{
        let item = items[row]
        guard let answered = item.is_answered else{
            return false
        }
        return answered
    }

}
