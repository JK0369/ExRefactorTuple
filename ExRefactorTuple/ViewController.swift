//
//  ViewController.swift
//  ExRefactorTuple
//
//  Created by 김종권 on 2023/11/27.
//

import UIKit

class ViewController: UIViewController {
    let car = Car(brand: "tesla", model: "model y", year: 2023)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // before
        if car.chargeForFix() == 0 {
            print("무료로 수리 혹은 수리할곳이 없음")
        } else {
            print("유료로 수리")
        }
        
        // after
        let (fixed, chargingPrice) = car.chargeForFix()
        if fixed {
            print("수리됨", chargingPrice)
        } else {
            print("수리 x", chargingPrice)
        }
    }
}

class Car {
    var brand: String
    var model: String
    var year: Int
    
    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
    
    func drive() {
        print("Driving \(brand) \(model)...")
    }
        
    // before
    func chargeForFix() -> Int {
        (0...10).randomElement()!
    }
    
    // after
    func chargeForFix() -> (fixed: Bool, chargingPrice: Int) {
        let price = (0...10).randomElement()!
        return (fixed: price == 0 ? false : true, chargingPrice: price)
    }
}

