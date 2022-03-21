import Foundation

struct CalculatorBrain {
    var billing: BillingProfile?
    
    mutating func calculateBill(total: Float, percent: Float, nbrPeople: Int) {
        let totalBill = (total + total*percent)/Float(nbrPeople)
        
        billing = BillingProfile(total: totalBill, percent: percent, nbrPeople: nbrPeople)
    }
    
    func getTotal() -> Float {
        let totalBill = billing?.total ?? 0.0
        return totalBill
    }
    
    func getNbrPeople() -> Int {
        return billing?.nbrPeople ?? 1
    }
    
    func getPercent() -> Float {
        return billing?.percent ?? 0.0
    }
    
    
}
