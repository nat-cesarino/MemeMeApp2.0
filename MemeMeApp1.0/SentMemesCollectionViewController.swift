//
//  SentMemesCollectionViewController.swift
//  MemeMeApp2.0
//
//  Created by Nathalie Cesarino on 21/01/22.
//

import Foundation
import UIKit

class SentMemesCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    
    //Array of memes
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        }
    
    // MARK: Collection View Data Source
    
    // Returns the amount of itens in collection
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemeCollectionViewCell", for: indexPath) as! SentMemeCollectionViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        //Set the image
        cell.sentMemeImageView?.image = UIImage

        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Grab the DetailVC from Storyboard
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "SentMemeDetailViewController") as! SentMemeDetailViewController
        
        // Populate view controller with data from the selected item
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        
        //Present the view controller using navigation
        self.navigationController!.pushViewController(detailController, animated: true)
 
    }
    
}



