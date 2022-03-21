import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var calculatorBrain = CalculatorBrain()
    var pctChose: Float = 0.0
    
    override func viewDidLoad() {
        tenPctButton.isSelected = true
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let btnTitle = sender.currentTitle
        
        if (btnTitle == zeroPctButton.currentTitle) {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            pctChose = 0.0
        } else if (btnTitle == tenPctButton.currentTitle) {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            pctChose = 0.1
        } else if (btnTitle == twentyPctButton.currentTitle) {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            pctChose = 0.2
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format:"%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalBill = Float(billTextField.text!)!
        let nbrPeople = Int(splitNumberLabel.text!)!

        calculatorBrain.calculateBill(total: totalBill, percent: pctChose, nbrPeople: nbrPeople)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.percent = calculatorBrain.getPercent()
            destinationVC.total = calculatorBrain.getTotal()
            destinationVC.nbrPeople = calculatorBrain.getNbrPeople()
        }
    }
    
    
}

