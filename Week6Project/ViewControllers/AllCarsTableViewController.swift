//
//  AllCarsTableViewController.swift
//  Week6Project
//
//  Created by Rania Arbash on 2023-02-17.
//

import UIKit

class AllCarsTableViewController: UITableViewController {
    var numOfCars = 0
    
    var managerOjbect = (UIApplication.shared.delegate as! AppDelegate).myCarsManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = numOfCars > 1 ? "\(numOfCars) cars" : "\(numOfCars) car"
          }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return managerOjbect.allCars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       if managerOjbect.allCars[indexPath.row].getYear() < 2024 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CarTableViewCell
            cell.carModel.text = managerOjbect.allCars[indexPath.row].getModel()
           
            cell.carYear.text = "\(managerOjbect.allCars[indexPath.row].getYear() )"

            if managerOjbect.allCars[indexPath.row].getYear() > 2015 {
                cell.carImage.image = UIImage(named: "newcar")
            }else {
                cell.carImage.image = UIImage(named: "oldcar")
            }
            return cell
            
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.textLabel?.text = "No Cars available Yet"
            return cell
            
        }
     
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       
        
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            managerOjbect.deleteACar(index: indexPath.row)
            tableView.reloadData()
            
        } else if editingStyle == .insert {
           
        }
    }
    

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
