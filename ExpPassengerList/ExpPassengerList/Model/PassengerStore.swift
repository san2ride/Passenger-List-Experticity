//
//  PassengerStore.swift
//  ExpPassengerList
//
//  Created by don't touch me on 10/23/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class PassengerStore {
    
    var allPassengers = [Passenger]()
    
    func createList() -> Passenger {
        let newList = Passenger(random: true)
        
        allPassengers.append(newList)
        
        return newList
    }
    
    func removePassenger(passenger: Passenger) {
        if let index = allPassengers.index(of: passenger) {
            allPassengers.remove(at: index)
        }
    }
    
    func movePassengerAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being moved so you can reinsert it
        let movedPassenger = allPassengers[fromIndex]
        
        // Remove item from array
        allPassengers.remove(at: fromIndex)
        
        // Insert intem in array at new location
        allPassengers.insert(movedPassenger, at: toIndex)
        
    }
}
