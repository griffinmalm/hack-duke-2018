//
//  FoodTableViewController.swift
//  NoMoreWaste
//
//  Created by Seth Tilliss on 10/13/18.
//  Copyright © 2018 Seth Tilliss. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController
{
    
    var restaurants:[Restaurant] =
        
        [
            
            Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", image: "cafedeadend.jpg", number: "232-923423", isVisited: false),
            
            Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", image: "homei.jpg",number: "345-563789", isVisited: false),
            
            Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "teakha.jpg",number: "678-345634", isVisited: false),
            
            Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "cafeloisl.jpg",number: "914-584267", isVisited: false),
            
            Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "petiteoyster.jpg",number: "817-6743743", isVisited: false),
            
            Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", image: "forkeerestaurant.jpg",number: "793-583901", isVisited: false),
            
            Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", image: "posatelier.jpg",number: "914-582593", isVisited: false),
            
            Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", image:
                "bourkestreetbakery.jpg",number: "836-387256", isVisited: false),
            
            Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", image: "haighschocolate.jpg",number: "936-682561", isVisited: false),
            
            Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", image: "palominoespresso.jpg",number: "978-683572", isVisited: false),
            
            Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", image: "upstate.jpg", number: "682-683691", isVisited:false),
            
            Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", image: "traif.jpg", number: "802-67289321", isVisited: false),
            
            Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", image: "grahamavenuemeats.jpg", number: "892-157493", isVisited: false),
            
            Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", image: "wafflewolf.jpg",number: "893-792671", isVisited: false),
            
            Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", image: "fiveleaves.jpg",number: "890-2561452", isVisited: false),
            
            Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", image: "cafelore.jpg",number: "914-672893", isVisited: false),
            
            Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", image: "confessional.jpg",number: "967-571829",isVisited: false),
            
            Restaurant(name: "Barrafina", type: "Spanish", location: "54 FRith Street London W1D 4SL United Kingdom", image: "barrafina.jpg",number: "893-682673", isVisited: false),
            
            Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", image: "donostia.jpg",number: "793-789245", isVisited: false),
            
            Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", image: "royaloak.jpg", number: "973-678392", isVisited: false),
            
            Restaurant(name: "Thai Cafe", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", image: "thaicafe.jpg",number: "563-678209", isVisited: false)
    ]
    
    // This function is important because it goes through the name, text, and location labels, as well as the thumbnail image of the cell, and assigns each data piece from the arrays at the top of this class in consecutive order.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        
        return cell
    }
    
    // This code makes the title bar disappear as you scroll down. This gives the app a more realistic feel.
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // Hiding the navigation bar
        navigationController?.hidesBarsOnSwipe = true
        
        // enabling self sizing cells
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler:
        {
            (action, indexPath) -> Void in
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image)
            {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title:
            "Delete",handler:
            {
                (action, indexPath) -> Void in
                // Delete the row from the data source
                self.restaurants.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        return [deleteAction, shareAction]
    }
    
    //overriding the default implement of the prepareForSegue method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showRestaurantDetail"
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
                let destinationController = segue.destination as!
                RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }
}

