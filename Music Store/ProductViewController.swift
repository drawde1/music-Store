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
    var clickedData: AlbumData?
    
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
        clickedData = nil
    }
    @objc func saveSong(){
        guard let data = self.clickedData else {
             return
        }
        CoreDataManager().saveSong(data: data)
    }
    func configureButtons(){
        Cancel.addTarget(self, action: #selector(hideButtons), for: .touchUpInside)
        addToCart.addTarget(self, action: #selector(saveSong), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchAlbum), for: .touchUpInside)
    }
    @objc func searchAlbum(){
        if let text = searchBar.text{
            let url = "https://itunes.apple.com/search?term=\(text)&entity=album"
            albumViewModel?.fetchData(url: url)
            
        }
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
        guard let data = self.albumViewModel?.albumResults?.results[indexPath.row] else {
            return cell
        }
        cell.configureCell(data: data)
        return cell
    }
}
extension ProductViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Cancel.isHidden = false
        addToCart.isHidden = false
        guard let data = self.albumViewModel?.albumResults?.results[indexPath.row] else{
            return
        }
        clickedData = data
    }
}
extension ProductViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.bounds.width/2)-10)
        let height = ((collectionView.bounds.height/3)+10)
        return CGSize(width: width , height: height)
    }}

