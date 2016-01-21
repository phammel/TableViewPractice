//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Phammel on 1/13/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import UIKit
//bring in data source and delagte protocols for table view
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var myTableview: UITableView!
    @IBOutlet weak var edditbutton: UIBarButtonItem!
    
    
    var superheros : [SuperHeroClass] = []
    
    
    override func viewDidLoad()
   //---------------------------------------------------------------------------------------------------------------------------------------------------------------
    {
        super.viewDidLoad()
        //set table view datasource and delegate to view controller
        myTableview.dataSource = self
        myTableview.delegate = self
        edditbutton.tag = 0
        superheros.append(SuperHeroClass(Name: "batman", Ailias: "Bruce Wayne", Power: 70, Image: UIImage(named: "batman")!))
        superheros.append(SuperHeroClass(Name: "superman", Ailias: "clark", Power: 70, Image: UIImage(named: "superman")!))
        superheros.append(SuperHeroClass(Name: "aquaman", Ailias: "curry", Power: 100, Image: UIImage(named: "aquaman")!))
        superheros.append(SuperHeroClass(Name: "wonderwoman", Ailias: "dinna", Power: 80, Image: UIImage(named: "wonderwoman")!))
        superheros.append(SuperHeroClass(Name: "spiderman", Ailias: "peter", Power: 30, Image: UIImage(named: "default")!))
        
        
        
    }
    //-----------------------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func editTapped(sender: UIBarButtonItem)
    {
        
        if (edditbutton.tag == 0)
        {
            
            myTableview.editing = true
            edditbutton.tag = 1
        }
        else
        {
            myTableview.editing = false
            edditbutton.tag = 0
        }
        
    }
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    
    
    
    
    
    
    
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Super Hero", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler { (alertTextfeild) -> Void in
            alertTextfeild.placeholder = "Add Super Hero Name" // add place holder text
        }
        
        myAlert.addTextFieldWithConfigurationHandler { (realTextfeild) -> Void in
            realTextfeild.placeholder = "Add Super Hero's real Name" // add place holder text
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let superherotf = myAlert.textFields![0] as UITextField
             let realtf = myAlert.textFields![1] as UITextField
            
            self.superheros.append(SuperHeroClass(Name: superherotf.text!, Ailias: realtf.text!))
            self.myTableview.reloadData()
            
            
        }
        myAlert.addAction(addAction)
        
        
        self.presentViewController(myAlert, animated: true, completion: nil)//presents the alert view
    }
    //-------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    
    
    
    //required function for tabeleview protocol - sends data to cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {   //creates a cell varriable for table view
        let myCell = myTableview.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        //sets propertys of cell
        myCell.textLabel?.text = superheros[indexPath.row].name
        myCell.detailTextLabel?.text = superheros[indexPath.row].ailias
        myCell.imageView?.image = superheros[indexPath.row].image
       
        
        
        return myCell
    }
    
    
    
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------
    //required function for tabeleview protocol-set number of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheros.count
    }
    
    //---------------------------------------------------------------------------------------------------------------------------------------------------------------
    //allows you to remove a row from table view
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if (editingStyle == .Delete)
        {
        
            superheros.removeAtIndex(indexPath.row)
            myTableview.reloadData() // reload table view
        }
        
    }
    
   //---------------------------------------------------------------------------------------------------------------------------------------------------------------
    //alows you to move rows
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
       return true
    }
    
 //---------------------------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let superhero = superheros[sourceIndexPath.row]
        superheros.removeAtIndex(sourceIndexPath.row)
        superheros.insert(superhero, atIndex: destinationIndexPath.row)
        
        
    }
 //---------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
            let detailview = segue.destinationViewController as! DetailViewController
            let selectedrow = myTableview.indexPathForSelectedRow?.row
        
            detailview.superHero = superheros[selectedrow!]
        
        
    }

    


}

