//
//  SentMemeDetailViewController.swift
//  MemeMeApp1.0
//
//  Created by Nathalie Cesarino on 21/01/22.
//

import Foundation
import UIKit

class SentMemeDetailViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var memeImage: UIImageView!
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        memeImage.image = meme.memedImage
        self.tabBarController?.tabBar.isHidden = true
    }
}
