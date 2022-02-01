
import UIKit

class SearchQuestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet private weak var searchLabel: UILabel!
    @IBOutlet private weak var searchBar: UISearchBar!
    var searchQuestionViewModel: SearchQuestionsViewModel!
    @IBOutlet private weak var questionsTableView: UITableView!
    @IBOutlet private weak var busyIndicator: UIActivityIndicatorView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        searchQuestionViewModel = SearchQuestionsViewModel(searchQuestionsDelegate: self)
    }
    
    func setupTableView(){
        searchBar.delegate = self
        questionsTableView.delegate = self
        questionsTableView.dataSource = self
        questionsTableView.backgroundColor = .clear
        questionsTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        questionsTableView.register(QuestionTableViewCell.nib(), forCellReuseIdentifier: QuestionTableViewCell.cellIdentifier)
        busyIndicator.isHidden = true
        questionsTableView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchQuestionViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.cellIdentifier, for: indexPath) as? QuestionTableViewCell else {
            return UITableViewCell()
        }
        let title = searchQuestionViewModel.title(row: indexPath.row)
        let onwerName = searchQuestionViewModel.questionOwner(row: indexPath.row)
        let votes = searchQuestionViewModel.votes(row: indexPath.row)
        let answers = searchQuestionViewModel.answers(row: indexPath.row)
        let views = searchQuestionViewModel.views(row: indexPath.row)
        let answered = searchQuestionViewModel.answered(row: indexPath.row)
        cell.configureCellData(title: title, onwerName: onwerName, votes: votes, answers: answers, views: views, isQuestionAnswered: answered)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewQuestionViewController = ViewQuestionViewController()
        let viewModel = ViewQuestionViewModel(item: searchQuestionViewModel.itemAtIndex(row: indexPath.row))
        viewQuestionViewController.viewQuestionViewModel = viewModel
        self.navigationController?.pushViewController(viewQuestionViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension SearchQuestionsViewController: SearchQuestionsDelegate, UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else{
            return
        }
        searchLabel.isHidden = true
        busyIndicator.isHidden = false
        busyIndicator.startAnimating()
        searchQuestionViewModel.retrieveQuestionsForKeyword(keyword: keyword)
    }
    
    func questionsReceived() {
        DispatchQueue.main.async {
            self.busyIndicator.stopAnimating()
            self.busyIndicator.isHidden = true
            
            self.questionsTableView.isHidden = false
            self.questionsTableView.reloadData()
        }
    }
    
    func errorEncountered() {
        
    }
}



