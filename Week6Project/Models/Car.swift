//
//  Car.swift
//  Week6Project
//
//  Created by Rania Arbash on 2023-02-17.
//

import Foundation

class Car {
    private var model: String
    private var year : Int
    
   
    init(m : String, y: Int){
        model = m
        year = y
    }
    
    func getYear() -> Int{
        return year
    }
    func getModel() -> String{
        return model
    }
    
    
}

class CarsDataSet {
    
    var allCars = [Car]()

    func addNewCar(m : String, y: Int){
        allCars.append(Car(m: m, y: y))
    }
    
    func deleteACar(index : Int){
        allCars.remove(at: index)
        
    }
    
    
}


