//
//  SentMemesCollectionViewController.swift
//  MemeMeApp2.0
//
//  Created by Nathalie Cesarino on 21/01/22.
//

import Foundation
import UIKit

private let reuseIdentifier = "SentMemeCollectionViewCell"

class SentMemesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: Properties
    
    //Array of memes
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space: CGFloat = 3.0
        let dimension_width = (view.frame.size.width - (2*space)) / 3.0
        let dimension_height = (view.frame.size.height - (2*space)) / 3.0
        
        // Size between items within a row or column
        flowLayout.minimumInteritemSpacing = space
        
        // Size between rows or columns
        flowLayout.minimumLineSpacing = space
        
        // Size of your cells:
        flowLayout.itemSize = CGSize(width: dimension_width, height: dimension_height)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
        self.tabBarController?.tabBar.isHidden = false
        }
    
    // MARK: Collection View Data Source
    
    // Returns the amount of itens in collection
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SentMemeCollectionViewCell
        
        //Configure the cell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        //Set the image
        cell.sentMemeImageView.image = meme.memedImage

        return cell
        
    }
    
    // MARK: Collection View Delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Grab the DetailVC from Storyboard
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "SentMemeDetailViewController") as! SentMemeDetailViewController
        
        // Populate view controller with data from the selected item
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        
        //Present the view controller using navigation
        self.navigationController!.pushViewController(detailController, animated: true)
 
    }
    
}



