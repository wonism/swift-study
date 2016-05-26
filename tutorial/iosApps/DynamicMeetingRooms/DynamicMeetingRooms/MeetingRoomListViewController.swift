//
//  MeetingRoomListViewController.swift
//  DynamicMeetingRooms
//
//  Created by 김재원 on 2016. 5. 23..
//  Copyright © 2016년 Jaewonism. All rights reserved.
//

import UIKit

class MeetingRoomListViewController: UITableViewController {
    var service: Service?

    var meetingRooms: [String : [String : Int]] = ["Meeting" : ["Banksy" : 4, "Rivera" : 8, "Kahlo" : 8, "Picasso" : 10], "Seminar" : ["Cezanne" : 20, "Matisse" : 30, "Renoir" : 40]]
    func meetingRoomsAtIndex(index: Int) -> (key: String, value: [String : Int]) {
        let orderedMeetingRooms = meetingRooms.sort({ $0.1.first!.1 < $1.1.first!.1 })
        return orderedMeetingRooms[index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.title = service?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meetingRooms.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // let categoryValues = Array(meetingRooms.values)[section]
        // return categoryValues.count
        /// let orderedMeetingRooms = meetingRooms.sort({ $0.1.first!.1 < $1.1.first!.1 })
        /// let rowCount = orderedMeetingRooms[section].1.count
        //// let rowCount = meetingRoomsAtIndex(section).value.count
        guard let rowCount = service?.items?.count else {
            return 0
        }
        
        return rowCount
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath)

        // Configure the cell...
        guard let meetingRoom = service?.items?[indexPath.row] else {
            return cell
        }
        
        cell.textLabel!.text = meetingRoom.name
        cell.detailTextLabel!.text = String(meetingRoom.capacity)
        
        return cell
    }
        
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
