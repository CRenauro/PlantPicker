//
//  PlantCollectionViewController.swift
//  PlantPicker
//
//  Created by Clara Renauro on 1/28/22.
//

import UIKit

private let reuseIdentifier = "Cell"



class PlantCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    

    @IBAction func unwindToMain(segue: UIStoryboardSegue) {

    }

    
    private var plant : [Plant] = [Plant(image: "passion", name: "passion"),
                                    Plant(image: "sunflower", name: "sunflower"),
                                    Plant(image: "monstera", name: "monstera"),
                                    Plant(image: "flower", name: "flower"),
                                    Plant(image: "leaf", name: "leaf"),
                                    Plant(image: "cactus", name: "cactus"),
                                    Plant(image: "rainbow", name: "rainbow"),
                                    Plant(image: "orange", name: "orange"),
                                    Plant(image: "lavender", name: "lavender"),
                                    Plant(image: "leaves", name: "leaves"),
                                    Plant(image: "conifer", name: "conifer"),
                                    Plant(image: "pasque", name: "pasque"),
                                    Plant(image: "pastel", name: "pastel"),
                                    Plant(image: "tulip", name: "tulip"),
                                    Plant(image: "peony", name: "peony"),
                                    Plant(image: "daisy", name: "daisy"),
                                    Plant(image: "iris", name: "iris"),
                                    Plant(image: "grass", name: "grass"),
                                    Plant(image: "rose", name: "rose")]

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return plant.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 122, height: 130)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! PlantsCollectionViewCell
    
        // Configure the cell
        let plant = plant[indexPath.row]
        
//        let plantImageView = UIImageView(frame: cell.contentView.bounds)//added
        
//        cell.plantImageView.image = UIImage(named: plant.image) // turning this on loads the images but at the wrong size with errors
        
        cell.plantImageView.contentMode = .scaleAspectFit //added
        cell.clipsToBounds = true //added
//        cell.frame = CGRect(x: 0, y: 0, width: 122, height: 130
//        )
        cell.plantNameLabel.text = plant.name
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPaths = collectionView.indexPathsForSelectedItems{
                let destinationController = segue.destination as!
                PlantDetailViewController
                destinationController.plant = plant[indexPaths[0].row]
                collectionView.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
   

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
