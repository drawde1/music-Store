//
//  coreDataManager.swift
//  Music Store
//
//  Created by Rave Bizz on 6/23/21.
//

import Foundation
import CoreData
import UIKit

struct CoreDataManager {
    
    func saveSong(data: AlbumData){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        guard let viewContext = container?.viewContext else {return}
        
        let song = Song(context: viewContext)
        song.name = data.collectionName
        song.photo = data.artworkUrl100
        
        guard let price = data.collectionPrice else {
            return
        }
        
        song.price = price
        song.purchased = false
        guard let user = UserModel.shared.user else{
            return
        }
        song.owner = user
        do{
            try viewContext.save()
            //for testing  purposes only
//            self.fetchSongs()
        }
        catch{
            print("coreData/coreDataeManager Line 39: \(error.localizedDescription)")
        }
    }
    
    func fetchSongs(){
        //for testing purposes only
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        guard let viewContext = container?.viewContext else {return}
        
        let request: NSFetchRequest<Song> = Song.fetchRequest()
        
        do{
           let results = try viewContext.fetch(request)
            print(results)
        }
        catch{
            print("coreData/coreDataeManager Line 56: \(error.localizedDescription)")
        }
    }
    ///WIP does not work  currently ask ed about functionality
    
    func fetchSongs(user: User, purchased: Bool) -> [Song]?{
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        guard let viewContext = container?.viewContext else {return nil}
        
        let request: NSFetchRequest<Song> = Song.fetchRequest()
        request.predicate = NSPredicate(format: "owner = %@ AND purchased = %d", user, purchased)
        do{
           let results = try viewContext.fetch(request)
            return results
        }
        catch{
            print("coreData/coreDataeManager Line 73: \(error.localizedDescription)")
        }
        return nil
    }
    
}

