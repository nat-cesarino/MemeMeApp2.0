//
//  SentMemesTableViewController.swift
//  MemeMeApp1.0
//
//  Created by Nathalie Cesarino on 21/01/22.
//

import Foundation
import UIKit

var memes: [Meme]! {
    let object = UIApplication.shared.delegate
    let appDelegate = object as! AppDelegate
    return appDelegate.memes
}

