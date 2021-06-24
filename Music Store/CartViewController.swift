//
//  CartViewController.swift
//  Music Store
//
//  Created by Rave Bizz on 6/21/21.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var songs: [Song]?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        getCartData()
        // Do any additional setup after loading the view.
    }
    func getCartData(){
        if let user = UserModel.shared.user{
            songs = CoreDataManager().fetchSongs(user: user, purchased: false)
            print(songs)
        }
        else{
            print("no user found cart view controller line26:")
        }
    }
    
    func configureTable(){
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CartCell")
        tableView.dataSource = self
    }

}
extension CartViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = songs?.count else{
            return 2
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as? CartTableViewCell else{
            print("table cell failed to convert")
            return UITableViewCell()
        }
        return cell
    }
    
    
}
