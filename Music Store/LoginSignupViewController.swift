//
//  ViewController.swift
//  Music Store
//
//  Created by Rave Bizz on 6/21/21.
//

import UIKit
import CoreData

class LoginSignupViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!

    @IBAction func onSignup(_ sender: Any) {
        if loginField.text != "" || passwordField.text != "" {
            createUser(login: loginField.text ?? "user", password: passwordField.text ?? "123")
            let alert = UIAlertController(title: "Success!", message: "Thanks for signing up! Please login now!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
           let alert = UIAlertController(title: "Error", message: "Login/Password cannot be empty", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
           self.present(alert, animated: true)
       }
    }
        
    
    @IBAction func onLogin(_ sender: Any) {
//        deleteAllUsers()
        if loginField.text != "" || passwordField.text != "" {
            let fetchedUser = fetchUser(login: loginField.text!, password: passwordField.text!)
            if  fetchedUser != nil {
                UserModel.shared.user = fetchedUser!
                // GOTO PROFILE
                let storyBoard : UIStoryboard = UIStoryboard(name: "Profile", bundle:nil)
                let profileViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileView")
                self.navigationController?.pushViewController(profileViewController, animated: true)
            } else {
                let alert = UIAlertController(title: "Error", message: "Login/Password are incorrect", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Login/Password cannot be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        fetchData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        createUser()
//        fetchData()
//        fetchOneData(with: "Mattt", and: "123")
        
        // Do any additional setup after loading the view....
    }

    func createUser(login: String, password: String){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        guard let viewContext = container?.viewContext else {return}
        
        let user = User(context: viewContext)
        
        user.password = password
        user.name = login
        user.currentPoint = 0
        user.pointTreward = 0
        
        let song = Song(context: viewContext)
        song.name = "Fire"
        song.price = 10
        song.owner = user
        
        print(song)
        print(user)
        try? viewContext.save()
    }
    
    func deleteAllUsers() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        guard let viewContext = container?.viewContext else {return}
        
        let request: NSFetchRequest<NSFetchRequestResult> = User.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        let result = try? viewContext.execute(deleteRequest)
    }

    func fetchData(){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        guard let viewContext = container?.viewContext else {return}
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        let result = try? viewContext.fetch(request)
        
        print(result)
        print("Count \(result?.count)")
    }
    
    func fetchUser(login: String, password: String) -> User? {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        guard let viewContext = container?.viewContext else {return nil}
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        request.predicate = NSPredicate(format: "name = %@ AND password = %@", login, password)
        let result = try? viewContext.fetch(request)
        
        if result?.count ?? 0 > 0 {
            let loggedInModel = result?.first
//            let loggedInModel = UserModel(login: "", password: "", currentSpent: 1.0, spendToReward: 1.0)
            return loggedInModel
        }
        
//        print("Count \(result?.count)")
        return nil
    }
}

