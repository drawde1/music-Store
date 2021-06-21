//
//  ProductViewController.swift
//  Music Store
//
//  Created by Rave Bizz on 6/21/21.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        // Do any additional setup after loading the view.
    }
    func configureCollectionView(){
        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "ProductCell")
        self.collectionView.dataSource = self
    }
}

extension ProductViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCollectionViewCell else{
            print(" ProductViewController line 37: cell returned nil")
            return UICollectionViewCell()
        }
        return cell
    }
}
extension ProductViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((UIScreen.main.bounds.width/2) - 10)
        let height = ((UIScreen.main.bounds.height/6) - 25)
        return CGSize(width: width, height: height)
    }
}

