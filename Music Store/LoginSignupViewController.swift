//
//  ViewController.swift
//  Music Store
//
//  Created by Rave Bizz on 6/21/21.
//

import UIKit
import CoreData

class LoginSignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUser()
//        fetchData()
        fetchOneData(with: "Mattt", and: "123")
        
        // Do any additional setup after loading the view....
    }

    func createUser(){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        guard let viewContext = container?.viewContext else {return}
        
        let user = User(context: viewContext)
        
        user.password = "123"
        user.name = "Matt"
        UserModel().shared.setUser(user: user)
        print( UserModel().shared.user)
//        let song = Song(context: viewContext)
//        song.name = "Fire"
//        song.price = 10
//        song.owner = user
//
//        print(song)
        print(user)
        try? viewContext.save()
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
    
    func fetchOneData(with name: String, and password: String){
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        guard let viewContext = container?.viewContext else {return}
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        request.predicate = NSPredicate(format: "name = %@ AND password = %@", name, password)
        let result = try? viewContext.fetch(request)
        
//        print(result?.first?.songs)
//        print("Count \(result?.count)")
    }
}

