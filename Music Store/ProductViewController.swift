//
//  ProductViewController.swift
//  Music Store
//
//  Created by Rave Bizz on 6/21/21.
//

import UIKit

class ProductViewController: UIViewController {

    //Buttonsvvvvvv
    @IBOutlet weak var Cancel: UIButton!
    @IBOutlet weak var addToCart: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    //Buttons^^^^^^
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var albumViewModel: AlbumViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideButtons()
        configureCollectionView()
        configureViewModel()
        configureButtons()
        
    }
    func configureViewModel(){
        self.albumViewModel = AlbumViewModel(updateModel: {
            [weak self] in
            if let welf = self{
                welf.collectionView.reloadData()
            }
        })
        self.albumViewModel?.fetchData(url: "https://itunes.apple.com/search?term=a&entity=album")
    }
     @objc func hideButtons(){
        Cancel.isHidden = true
        addToCart.isHidden = true
    }
    func configureButtons(){
        Cancel.addTarget(self, action: #selector(hideButtons), for: .touchUpInside)
    }
    func configureCollectionView(){
        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "ProductCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
     
        }
}

extension ProductViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = self.albumViewModel?.albumResults?.results.count else{
            return 2
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCollectionViewCell
        else
        {
            print(" ProductViewController line 37: cell returned nil")
            return UICollectionViewCell()
        }
       
        cell.configureCell(data: albumViewModel?.albumResults?.results[indexPath.row] ?? AlbumData(collectionPrice: 0.2, collectionName: "yes", artworkUrl100: "yes"))
        return cell
    }
}
extension ProductViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Cancel.isHidden = false
        addToCart.isHidden = false
    }
}
//extension ProductViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: 2000, height: 2000)
//    }}

