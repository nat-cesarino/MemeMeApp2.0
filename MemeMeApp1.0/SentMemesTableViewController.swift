//
//  SentMemesTableViewController.swift
//  MemeMeApp1.0
//
//  Created by Nathalie Cesarino on 21/01/22.
//

import Foundation
import UIKit

class SentMemesTableViewController: UIViewController {
    
    var memes = [Meme]()
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        memes = getMemes()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
        memes = getMemes()
        tableView.reloadData()
    }
    
    // Retrive saved memes
    private func getMemes() -> [Meme] {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    // Setup navigation bar
    private func setupNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createMeme))
    }
    
    // Add the setup for the table view
    private func setupTableView() {
        tableView.delegate = self
        tableView.delegate = self
    }
    
   // Call the create meme view controller
    @objc func createMeme() {
        let editorViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EditorViewController") as! EditorViewController
        
        self.navigationController?.pushViewController(editorViewController, animated: true)
    }
}
    
    //MARK: Table View Setup
    
extension SentMemesTableViewController: UITableViewDataSource, UITableViewDelegate {
    // Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemeTableViewCell") as! SentMemeTableViewCell
        let meme = memes[(indexPath as NSIndexPath).row]
        
        cell.memeTitle.text = "\(meme.topText) ... \(meme.bottomText)"
        cell.memeImage.image = meme.memedImage
        
        return cell
    }
    
    // Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Grab the DetailVC from Storyboard
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "SentMemeDetailViewController") as! SentMemeDetailViewController
        
        // Populate view controller with data from the selected item
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        
        //Present the view controller using navigation
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
}
    
    




