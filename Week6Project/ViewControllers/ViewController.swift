//
//  ViewController.swift
//  Week6Project
//
//  Created by Rania Arbash on 2023-02-17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var carYearText: UITextField!
    @IBOutlet weak var carModelText: UITextField!
   
    var managerOjbect = (UIApplication.shared.delegate as! AppDelegate).myCarsManager

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }


    @IBAction func saveClicked(_ sender: Any) {
        
        if let modelText = carModelText.text {
            if let yearText = carYearText.text
            {
                if (modelText.count > 0) && (yearText.count > 0){
                    
                    if let goodYear = Int(yearText){
                       
                        if goodYear > 1970 && goodYear < 2030{
                        managerOjbect.addNewCar(m: modelText, y: goodYear)
                        
                            let alert =  UIAlertController.init(title: "All Done", message: "Your Car is Inserted into the DataSet", preferredStyle: .alert)
                        
                            alert.addAction( UIAlertAction.init(title: "OK", style: .cancel, handler: { action in
                                self.carYearText.text = ""
                                self.carModelText.text = ""
                            }))
                        
                        present(alert, animated: true)
                        }
                    }
                }
            }
        }
        
       
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let allCarsVC = segue.destination as! AllCarsTableViewController
        allCarsVC.numOfCars = managerOjbect.allCars.count
        
    }
    
}


