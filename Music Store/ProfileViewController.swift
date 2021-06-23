//
//  ProfileViewController.swift
//  Music Store
//
//  Created by Rave Bizz on 6/21/21.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var currentSpend: UILabel!
    @IBOutlet weak var spend: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name.text! = "Name: " + (UserModel.shared.user?.name ?? "N/A")
        self.currentSpend.text! = "Current Spent: \(UserModel.shared.user?.currentPoint ?? 0)"
        self.spend.text! = "Points to reward: \(UserModel.shared.user?.pointTreward ?? 0)"
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
