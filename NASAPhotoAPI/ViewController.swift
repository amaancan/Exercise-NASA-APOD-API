//
//  ViewController.swift
//  NASAPhotoAPI
//
//  Created by Amaan on 2018-01-02.
//  Copyright © 2018 Amaan Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Init text of labels so they can be changed later
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        // Call func which fetches photoInfo and makes our model obj, then Update UI with model obj
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                //Run this code to update UI in main (async) once you finally get the photo obj you fetched from API
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.descriptionLabel.text = photoInfo.description                    
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = "Copyright \(copyright)"
                    } else {
                        self.copyrightLabel.isHidden = true
                    }
                }
            }
        }
    }
    
    let photoInfoController = PhotoInfoController()
    
    

}

