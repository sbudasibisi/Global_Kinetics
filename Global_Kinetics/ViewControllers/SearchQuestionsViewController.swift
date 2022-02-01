//
//  ViewController.swift
//  Global_Kinetics
//
//  Created by Sibusiso Sibisi on 2022/01/29.
//

import UIKit

class SearchQuestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, QuestionsDelegate {
    func questionsReceived(items: [Items]) {
        self.items = items
        
        DispatchQueue.main.async {
            self.questionsTableView.reloadData()
        }
    }
    

    var items = [Items]()
    @IBOutlet private weak var questionsTableView: UITableView!
    
    var service = Service()

    override func viewDidLoad() {
        super.viewDidLoad()
        questionsTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        questionsTableView.delegate = self
        questionsTableView.dataSource = self
        questionsTableView.backgroundColor = .clear
        questionsTableView.register(QuestionTableViewCell.nib(), forCellReuseIdentifier: QuestionTableViewCell.cellIdentifier)
        service.questionsDelegate = self
        service.fetchSearchedItems(searchParameter: "")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.cellIdentifier, for: indexPath) as? QuestionTableViewCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        if let title = item.title{
            cell.title.text = title
        }
        if let onwerName = item.owner?.display_name{
            cell.onwerName.text = "asked by " + onwerName
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewQuestionViewController = ViewQuestionViewController()
        self.navigationController?.pushViewController(viewQuestionViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

}

protocol QuestionsDelegate{
    func questionsReceived(items: [Items])
}

