//
//  CollectionViewCell.swift
//  Expense Tracker
//
//  Created by MAK on 10/7/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var text: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 20

    }

}
