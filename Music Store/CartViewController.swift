//
//  CartViewController.swift
//  Music Store
//
//  Created by Rave Bizz on 6/21/21.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        //getCartData()
        // Do any additional setup after loading the view.
    }
    func getCartData(){
        if let user = UserModel.shared.user{
            CoreDataManager().fetchCart(user: user)
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
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as? CartTableViewCell else{
            print("table cell failed to convert")
            return UITableViewCell()
        }
        return cell
    }
    
    
}
