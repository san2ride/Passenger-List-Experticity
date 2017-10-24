//
//  Passenger.swift
//  ExpPassengerList
//
//  Created by don't touch me on 10/23/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class Passenger: NSObject, NSCoding {
    
    var id: String?
    var fullName: String
    var age: Int
    var weight: Int
    var seat: String
    
    init(id: String?, fullName: String, seat: String, age: Int, weight: Int) {
        self.id = id
        self.fullName = fullName
        self.age = age
        self.weight = weight
        self.seat = seat
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: "id") as! String
        fullName = aDecoder.decodeObject(forKey: "fullName") as! String
        age = aDecoder.decodeInteger(forKey: "age")
        weight = aDecoder.decodeInteger(forKey: "weight")
        seat = aDecoder.decodeObject(forKey: "seat") as! String

        super.init()

    }
    
    convenience init(random: Bool = false) {
        if random {
            let firstNames = ["Morty", "Kevin", "Tyrell", "Meryl", "Yong", "Megan", "Irwin", "Rufus", "Rosario", "Marjorie", "Teresia", "Ursula", "Charity", "Micha", "Giuseppe", "Temika", "Meghan", "Lissette", "Genesis", "Belle", "Tiesha", "Velva", "Sima", "Soraya", "Louis", "Glenda", "Thersa", "Lesli", "Saul", "Rueben", "Cortney", "Niesha", "Clorinda", "Shante", "Nereida", "Yvette", "Ardith", "Douglass", "Candra", "Hedy", "Ammie", "Margareta", "Flossie", "Dillon", "Hiroko", "Lester","Rick", "Fonda", "Willian", "Julian", "Winston", "Clarice"]
            let lastNames = ["Smith", "Jones", "Jackson", "Maxwell", "Trump", "Clinton", "Sanchez", "Williams", "Johnson", "Miller", "Taylor", "Thomas", "Garcia"]
            
            let seats = ["1A", "1B", "1C", "1D", "2A", "2B", "2C", "2D", "3A", "3B", "3C", "3D", "4A", "4B", "4C", "4D", "5A", "5B", "5C", "5D", "6A", "6B", "6C", "6D", "7A", "7B", "7C", "7D", "8A", "8B", "8C", "8D", "9A", "9B", "9C", "9D", "10A", "10B", "10C", "10D", "11A", "11B", "11C", "11D", "12A", "12B", "12C", "12D", "13A", "13B", "13C", "13D", "14A", "14B", "14C", "14D", "15A", "15B", "15C", "15D", "16A", "16B", "16C", "16D", "17A", "17B", "17C", "17D", "18A", "18B", "18C", "18D", "19A", "19B", "19C", "19D", "20A", "20B", "20C", "20D", "21A", "21B", "21C", "21D", "22A", "22B", "22C", "22D", "23A", "23B", "23C", "23D", "24A", "24B", "24C", "24D", "25A", "25B", "25C", "25D", "26A", "26B", "26C", "26D", "27A", "27B", "27C", "27D", "28A", "28B", "28C", "28D", "29A", "29B", "29C", "29D", "30A", "30B", "30C", "30D"]
            
            var idx = arc4random_uniform(UInt32(firstNames.count))
            let randomFirstName = firstNames[Int(idx)]
            
            idx = arc4random_uniform(UInt32(lastNames.count))
            let randomLastName = lastNames[Int(idx)]
            
            let randomName = "\(randomFirstName) \(randomLastName)"
            
            let idxx = arc4random_uniform(UInt32(seats.count))
            let randomSeat = seats[Int(idxx)]
            
            let randomAge = Int(arc4random_uniform(89))
            let randomWeight = Int(arc4random_uniform(350))
            let randomId = NSUUID().uuidString.components(separatedBy: "-").first!
            
            self.init(id: randomId,
                      fullName: randomName,
                      seat: randomSeat,
                      age: randomAge,
                      weight: randomWeight)
        }
        else {
            self.init( id: nil, fullName: "", seat: "", age: 0, weight: 0)
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(fullName, forKey: "fullName")
        aCoder.encode(id, forKey: "id")
        aCoder.encode(seat, forKey: "seat")
        aCoder.encode(age, forKey: "age")
        aCoder.encode(weight, forKey: "weight")
    }
}
