
import UIKit

class OngevalViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Naam"
        case 1:
            return "Symptomen"
        case 2:
            return "Behandeling"
        default:
            break
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return FirstAid.ongeval!.symptomen.count
        case 2:
            return FirstAid.ongeval!.behandeling.count
        default:
            break
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2{
            return 50.0
        }
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Detail", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = FirstAid.ongeval!.naam
        case 1:
            cell.textLabel?.text = FirstAid.ongeval!.symptomen[indexPath.row].description
        case 2:
            cell.textLabel?.text = FirstAid.ongeval!.behandeling[indexPath.row]
            cell.textLabel?.numberOfLines = 2
        default:
            break
        }
        
        return cell
    }
    
   
    @IBAction func bel112(_ sender: Any) {
        //source code van stackoverflow.com/questions/27259824
        //swift 3 upgrade: stackoverflow.com/questions/40078370
        /*if let phoneCallURL:NSURL = NSURL(string: "tel://112"){
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL as URL)){
                UIApplication.shared.open(phoneCallURL as URL, options: [:], completionHandler: nil)
            }
        }*/
    }
}
