import UIKit

class OverViewController: UIViewController {
    
    @IBAction func reset() {
        for index in 0..<main.lijstSymptomen
            model.scores[index].score = 0
        }
        tableView.reloadData()
    }
}
