import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: Float?
    var nbrPeople: Int?
    var percent: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let totalBill: String = String(format:"%.0f", total!)
        let settingTitle: String = "Split between \(nbrPeople!) people, with \(String(format:"%.0f", percent!*100))% tip."

        totalLabel.text = totalBill
        settingsLabel.text = settingTitle
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
