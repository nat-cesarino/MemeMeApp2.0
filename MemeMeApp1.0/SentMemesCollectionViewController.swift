//
//  SentMemesCollectionViewController.swift
//  MemeMeApp2.0
//
//  Created by Nathalie Cesarino on 21/01/22.
//
import Foundation
import UIKit

class SentMemesCollectionViewController: UIViewController {
    
    var memes = [Meme]()
    
    // MARK: Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupFlowLayout()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
        memes = getMemes()
        collectionView.reloadData()
    }
    
    // Setup Navigation Bar
    private func setupNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createMeme))
    }
    
    // Retrieve Saved Memes
    private func getMemes() -> [Meme] {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    // Add the setup for the collection view
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // Setup Flow Layout
    private func setupFlowLayout(){
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2*space)) / 3.0
        
        // Size between items within a row or column
        flowLayout.minimumInteritemSpacing = space
        // Size between rows or columns
        flowLayout.minimumLineSpacing = space
        // Size of your cells:
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    // Call the Editor view controller
    @objc func createMeme() {
        let editorViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EditorViewController") as! EditorViewController
        self.present(editorViewController, animated: true, completion: nil)
    }

}
    
    // MARK: Collection View Setup
    
extension SentMemesCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        
        // Collection View Data Source
        
        // Returns the amount of itens in collection
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return memes.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemeCollectionViewCell", for: indexPath) as! SentMemeCollectionViewCell
            
            //Configure the cell
            let meme = memes[(indexPath as NSIndexPath).row]
            
            //Set the image
            cell.sentMemeImageView.image = meme.memedImage
            return cell
            
        }
        
        // Collection View Delegate
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            // Grab the DetailVC from Storyboard
            let detailController = self.storyboard!.instantiateViewController(withIdentifier: "SentMemeDetailViewController") as! SentMemeDetailViewController
            
            // Populate view controller with data from the selected item
            detailController.meme = memes[(indexPath as NSIndexPath).row]
            
            //Present the view controller using navigation
            self.navigationController!.pushViewController(detailController, animated: true)
     
        }
}



