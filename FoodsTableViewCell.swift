////
////  RestaurantTableViewCell.swift
////  ProjectSeth2.0
////
////  Created by Tilliss, Seth on 10/7/16.
////  Copyright © 2016 Tilliss, Seth. All rights reserved.
////
//
import UIKit

class FoodsTableViewCell: UITableViewCell
{
    
    // These four lines are important because they are creating a connection between the labels and image, in the prototype cell, and the code. Now we can reference the specific labels by their variable name when we go to assign them specific data from the array.
//    @IBOutlet var nameLabel: UILabel!
//    @IBOutlet var survivalLabel: UILabel!
//    @IBOutlet var expirationLabel: UILabel!
    //@IBOutlet var thumbnailImageView: UIImageView!



    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var survivalLabel: UILabel!
    
    @IBOutlet weak var expirationLabel: UILabel!

    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
