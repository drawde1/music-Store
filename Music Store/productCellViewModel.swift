//
//  productCellViewModel.swift
//  Music Store
//
//  Created by Rave Bizz on 6/23/21.
//

import Foundation


class ProductViewModel{
    init(saveImage: @escaping ()->Void){
        self.saveImage = saveImage
    }
    var saveImage: () -> Void
    var imageData: Data?{
        didSet{
            DispatchQueue.main.async {
                self.saveImage()
            }
        }
    }
    func fecthData(url: URL){
        APIManager().getData(url: url, completion: {
            data in
            guard let data = data else{
                print("productViewModel line17: data returned nil")
                return
            }
            self.imageData = data
        })
    }
}
