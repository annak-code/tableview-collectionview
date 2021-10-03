//
//  Task2TableViewController.swift
//  Module10
//
//

import UIKit
/*
struct Settings {
    var type = ""
    var names: [String] = []
}

class SettingsData {
    static func defaultSettings() -> [Settings] {
        return [
            Settings(type: "Connection Center", names: ["Airplane Mode", "Wi-Fi", "Bluetooth", "Mobile Data", "Personal Hotspot", "VPN"]),
            Settings(type: "Notification Center", names: ["Notifications", "Sounds & Haptics", "Do Not Disturb", "Screen Time"]),
            Settings(type: "General Settings Center", names: ["General", "Control Centre", "Display & Brightness", "Home Screen", "Accessibility", "Wallpaper", "Siri & Search", "Touch ID & Passcode", "Emergence SOS", "Exposure Notifications", "Battery", "Privacy"]),
            Settings(type: "Purchase Center", names: ["App Store", "Wallet & Apple Pay"])
        ]
    }
}
 */

class Task2TableViewController: UITableViewController {

    @IBOutlet var settingsTableView: UITableView!
    
    var settingsData: [[SettingsItem]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsData = SettingsData.defaultSettingsData
        print(settingsData.count)
        print(settingsData)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return settingsData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return settingsData[section].count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Header") as! Task2TableViewCell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Task2TableViewCell
        let item = settingsData[indexPath.section][indexPath.row]
       
        cell.nameLabel.text = item.name
        cell.iconImageView.image = UIImage(systemName: "\(item.icon)")
        if !item.textLabel.isEmpty {
            cell.textInfoLabel.isHidden = false
            cell.textInfoLabel.text = item.textLabel
        }
        
        if item.switcher {
            cell.switchOutlet.isHidden = false
        }
        if item.disclosureIndicator {
            cell.accessoryType = .disclosureIndicator
        }

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /*
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.0
        default:
            return UITableView.automaticDimension
        }
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
