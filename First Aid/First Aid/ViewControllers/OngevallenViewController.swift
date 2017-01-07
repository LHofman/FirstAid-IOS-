
import UIKit

class OngevallenViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FirstAid.lijstOngevallen.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Ongeval", for: indexPath) as! OngevalPreview
        let ongeval = FirstAid.geefOngevallen()[indexPath.row]
        cell.ongeval.text = "\(ongeval.naam)"
        cell.tag = indexPath.row
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        FirstAid.setOngeval(index: indexPath.row)
        performSegue(withIdentifier: "Ongeval", sender: nil)
    }
    
    @IBAction func unwindFromOngeval(_ segue: UIStoryboardSegue) {}

}
