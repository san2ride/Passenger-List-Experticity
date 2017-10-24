//
//  PassengerListController.swift
//  ExpPassengerList
//
//  Created by don't touch me on 10/23/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class PassengerListController: UITableViewController {

    var passengerStore: PassengerStore!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func addNewPassenger(_ sender: UIBarButtonItem) {
        // Create a new item and add it to the store
        let newList = passengerStore.createList()

        // Figure out where that item is in array
        if let index = passengerStore.allPassengers.index(of: newList) {
            let indexPath = NSIndexPath(row: index, section: 0)

            // Insert this new row into the table
            tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 128, height: 42))
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "experticity")
        imageView.image = image
        
        navigationItem.titleView = imageView
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 70
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return passengerStore.allPassengers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PassListCell", for: indexPath) as! PassengerListCell
        
        // Setting the text on the cell with the description of the passenger
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let passenger = passengerStore.allPassengers[indexPath.row]
        
        cell.fullNameLabel.text = passenger.fullName
        cell.idLabel.text = passenger.id
        cell.seatNumberLabel.text = passenger.seat
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let passenger = passengerStore.allPassengers[indexPath.row]
            
            let title = "Delete \(passenger.fullName)?"
            let message = "Are you sure you want to delete this passenger?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            
                // Remove the item from the store
                self.passengerStore.removePassenger(passenger: passenger)
                
                // Also remove that row from the tableview with an animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
        
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // Update the model
        passengerStore.movePassengerAtIndex(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If triggered segue is the "ShowPassenger" segue
        if segue.identifier == "ShowPassenger" {
            
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                // Get the passenger associated with this row and pass it along
                let passenger = passengerStore.allPassengers[row]
                let passengerListViewController = segue.destination as! PassengerListViewController
                passengerListViewController.passenger = passenger
            }
        }
    }
}
