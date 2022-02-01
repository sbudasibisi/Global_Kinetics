//
//  ViewQuestionViewController.swift
//  Global_Kinetics
//
//  Created by Sibusiso Sibisi on 2022/02/01.
//

import UIKit

class ViewQuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Question"
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var dateAskedLabel: UILabel!
    
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var ownerReputationLabel: UILabel!
}
