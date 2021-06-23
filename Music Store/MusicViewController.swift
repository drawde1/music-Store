//
//  MusicViewController.swift
//  Music Store
//
//  Created by Rave Bizz on 6/21/21.
//

import UIKit

class MusicViewController: UIViewController {

    @IBOutlet weak var colectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func configureCollectionView(){
        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        self.colectionView.register(nib, forCellWithReuseIdentifier: "ProductCell")
        self.colectionView.dataSource = self
        self.colectionView.delegate = self
     
        }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MusicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCollectionViewCell
        else
        
        {
            print(" ProductViewController line 37: cell returned nil")
            return UICollectionViewCell()
        }

        return cell
    }
    
}

extension MusicViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.bounds.width/2)-10)
        let height = ((collectionView.bounds.height/3)+10)
        return CGSize(width: width , height: height)
    }}

