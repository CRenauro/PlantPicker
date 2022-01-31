//
//  PlantDetailViewController.swift
//  PlantPicker
//
//  Created by Clara Renauro on 1/30/22.
//

import UIKit

class PlantDetailViewController: UIViewController {
    

    var plant: Plant?
    
    @IBOutlet var plantImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plantImageView.image = UIImage(named: plant?.image ?? "")
    }
    
    
    
}
