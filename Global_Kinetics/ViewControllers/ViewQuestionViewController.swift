

import UIKit

class ViewQuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var dateAskedLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var ownerReputationLabel: UILabel!
    var viewQuestionViewModel: ViewQuestionViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Question"
        answerTextView.contentInset = UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
        configureData()
    }
    
    func configureData(){
        questionLabel.text = viewQuestionViewModel.title()
        answerTextView.attributedText = viewQuestionViewModel.body()
        ownerName.text = viewQuestionViewModel.ownerName()
        dateAskedLabel.text = viewQuestionViewModel.askDate()
        tagsLabel.text = viewQuestionViewModel.tags()
        ownerReputationLabel.text = viewQuestionViewModel.ownerProfileReputation()
        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string:self.viewQuestionViewModel.ownerProfilePic()){
            do {
                let image = UIImage(data: try Data(contentsOf: url))
                DispatchQueue.main.async {
                    self.userIcon.image = image
                }
            }
            catch{}
            }
        }
    }
}
