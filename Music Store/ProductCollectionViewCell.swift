//
//  ProductCollectionViewCell.swift
//  Music Store
//
//  Created by Rave Bizz on 6/21/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    var Image: UIImage?
    var productViewModel: ProductViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(data: AlbumData){
        productViewModel = ProductViewModel(saveImage: {
            [weak self] in
            guard let welf = self else {
                return
            }
           let  data = welf.productViewModel?.imageData
            if let data = data {
                welf.Image = UIImage(data: data)
            }
            else{
                print("data could not convert to image line: 32")
            }
        })
        guard let url = URL(string: data.artworkUrl100) else{
            return
        }
        productViewModel?.fecthData(url: url)
        if let image = Image {
            self.albumImage.image = image
        }
        else{
            print("image returned nil")
        }
        
        self.title.text = data.collectionName
        self.price.text = "\(data.collectionPrice ?? 0.00)."
        }

}
