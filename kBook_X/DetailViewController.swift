//
//  DetailViewController.swift
//  kBook_X
//
//  Created by Joseph Scala on 6/10/18.
//  Copyright © 2018 Wreck-All Labs. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var detailItem: Song? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            self.title = detail.SongTitle + " - " + detail.ArtistName
            
            if let label = detailDescriptionLabel {
                label.text = detail.Lyrics
            }
            
            if let label = notesLabel {
                label.text = detail.Notes
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

