//
//  ProductCell.swift
//  VWNTask
//
//  Created by Amirkhouzam on 29/04/2022.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var Productprice: UILabel!
    @IBOutlet weak var productname: UILabel!
    @IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var backview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backview.layer.cornerRadius = 20
        Productprice.textColor = .lightGray
    }

}
