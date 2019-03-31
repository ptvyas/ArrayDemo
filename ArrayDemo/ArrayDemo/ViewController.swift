//
//  ViewController.swift
//  ArrayDemo
//
//  Created by PiyushVyas on 29/03/19.
//  Copyright © 2019 PiyushVyas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let placesArray : NSMutableArray = NSMutableArray.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // More Info
        // https://stackoverflow.com/a/51488099/10763400
        // 
        self.placesArray.add("Hello")
        self.placesArray.add("Hi")
        self.placesArray.add(123)
        self.placesArray.add(123.456)
        self.placesArray.add(-0.456)
        self.placesArray.add("My Name is Vyas")
        print("Get Array : \(placesArray)")
        
        do {
        let placesData = try NSKeyedArchiver.archivedData(withRootObject: placesArray, requiringSecureCoding: false)
            print("Get placesData : \(placesData)")
            UserDefaults.standard.set(placesData, forKey: "places")
        } catch {
            print("Can't encode data")
        }
        
        
        //To Retrieved array from NSUserDefault.
        let placesData = UserDefaults.standard.object(forKey: "places") as? NSData
        if let placesData = placesData {
            do {
                let arrPlaces : NSMutableArray = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(placesData as Data) as! NSMutableArray
                print("Get Array : \(arrPlaces)")
                print("Get Array : \(arrPlaces.firstObject ?? "NoValue-First")")
                print("Get Array : \(arrPlaces.lastObject ?? "NoValue-Last")")
            } catch {
                print("Can't de-encode data")
            }
        }
    }
}

