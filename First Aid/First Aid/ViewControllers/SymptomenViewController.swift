import UIKit

class SymptomenViewController: UITableViewController {
    
    var symptomen: [(symptoom: Symptoom, aanwezig: Bool)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FirstAid.lijstSymptomen.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 50
        
        if symptomen.isEmpty{
            for symptoom in FirstAid.lijstSymptomen{
                symptomen.append((symptoom, false))
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Symptoom", for: indexPath) as! SymptoomPreview
        let (symptoom, aanwezig) = symptomen[indexPath.row]
        cell.symptoom.text = "\(symptoom.rawValue)"
        cell.aanwezig.isOn = aanwezig
        cell.aanwezig.tag = indexPath.row
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "ongevallen":
            let sympt = symptomen.filter{$0.aanwezig}.map{$0.symptoom}
            FirstAid.voegSymptomenToe(sympt)
        default:
            break
        }
    }
    
    @IBAction func unwindFromOngevallen(_ segue: UIStoryboardSegue) {}
    
    @IBAction func reset(_ sender: Any) {
        for i in 0..<symptomen.count{
            symptomen[i].aanwezig = false
        }
        tableView.reloadData()
        FirstAid.resetOngevallen()
    }
    @IBAction func voegSymptoomToe(_ sender: UISwitch) {
        symptomen[sender.tag].aanwezig = true
    }
}
