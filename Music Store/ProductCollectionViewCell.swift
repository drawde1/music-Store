//
//  ProductCollectionViewCell.swift
//  Music Store
//
//  Created by Rave Bizz on 6/21/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(data: AlbumData){
        self.title.text = data.collectionName
            
        self.price.text = "\(data.collectionPrice ?? 0.00)."
        
          }
}
