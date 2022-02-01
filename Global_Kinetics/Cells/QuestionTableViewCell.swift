
import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var onwerName: UILabel!
    @IBOutlet private weak var votes: UILabel!
    @IBOutlet private weak var answers: UILabel!
    @IBOutlet private weak var views: UILabel!
    @IBOutlet weak var imageViewWidthConstraint: NSLayoutConstraint!
    
    static let cellIdentifier = "QuestionTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "QuestionTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
        contentView.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCellData(title: String, onwerName: String, votes: String, answers: String, views: String, isQuestionAnswered: Bool){
        self.title.text = title
        self.onwerName.text = onwerName
        self.votes.text = votes
        self.answers.text = answers
        self.views.text = views
        imageViewWidthConstraint.constant = isQuestionAnswered == true ? 20 : 0
        
    }
    
}
