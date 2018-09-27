//
//  ViewController.swift
//  GPUImageLookupFilter
//
//  Created by Thanh Nguyen on 6/19/18.
//  Copyright © 2018 Thanh Nguyen. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {

    @IBOutlet weak var filteredImageView: UIImageView!
    @IBOutlet weak var filterNameLabel: UILabel!
    @IBOutlet weak var didClickRandomButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        randomPhoto()
    }

    func randomPhoto() {

        var DemoPhoto = ["DemoPhoto1", "DemoPhoto2", "DemoPhoto3", "DemoPhoto4", "DemoPhoto5"]

        let randomIndex = Int(arc4random_uniform(UInt32(DemoPhoto.count)))
        let originImage = DemoPhoto[randomIndex]

        filteredImageView.image = UIImage(named: originImage)
        filteredImageView.contentMode = .scaleAspectFit
    }

    func filterPhoto() {

        let originImage = UIImage(named: "DemoPhoto4")

        var lookupImageNames = ["lookup_amatorka", "lookup_fgfacolor", "lookup_lofi", "lookup_mayfair", "lookup_miss_etikate", "lookup_nashville", "lookup_nguocnang", "lookup_soft_elegance_1", "lookup_soft_elegance_2", "lookup_Retro", "lookup_Black", "lookup_Elegant"]

        let randomIndex = Int(arc4random_uniform(UInt32(lookupImageNames.count)))
        let lookupImageName = lookupImageNames[randomIndex]

        guard let lookupImage = UIImage(named: lookupImageName) else { return }
        guard let lookupFilter = LookupFilter(withLookupImage: lookupImage) else { return }

        let filteredImage = lookupFilter.image(byFilteringImage: originImage)

        filteredImageView.image = filteredImage
        filteredImageView.contentMode = .scaleAspectFit
        filterNameLabel.text = lookupImageName
    }

    @IBAction func didClickRandomButton(_ sender: Any) {

        filterPhoto()
    }
}

