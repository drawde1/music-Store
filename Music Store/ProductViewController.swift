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
    var albumViewModel: AlbumViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewModel()
        self.albumViewModel?.fetchData(url: "https://itunes.apple.com/search?term=a&entity=album")
    }
    func configureViewModel(){
        self.albumViewModel = AlbumViewModel(updateModel: {
            [weak self] in
            if let welf = self{
                print("$$$$$$$$", welf.albumViewModel?.albumResults?.results[0])
            }
          
        })
        
    }
    
    
    func configureCollectionView(){
        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "ProductCell")
        self.collectionView.dataSource = self
//        self.collectionView.delegate = self
     
        }
}

extension ProductViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCollectionViewCell else{
            print(" ProductViewController line 37: cell returned nil")
            return UICollectionViewCell()
        }
        return cell
    }
}
//extension ProductViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: 2000, height: 2000)
//    }}

