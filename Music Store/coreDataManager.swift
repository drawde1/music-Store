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
        guard let user = UserModel().shared.user else{
            return
        }
        song.owner = user
        do{
            try viewContext.save()
        }
        catch{
            print("coreData/coreDataeManager Line 37: \(error.localizedDescription)")
        }
    }
    
    
}

