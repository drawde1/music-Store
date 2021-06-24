//
//  albumModelView.swift
//  Music Store
//
//  Created by Rave Bizz on 6/22/21.
//

import Foundation


class AlbumViewModel {
    init(updateModel:@escaping ()->Void){
        self.updateModel = updateModel
    }
    var updateModel: ()->Void
    
    var albumResults: AlbumResponse?{
        didSet{
            DispatchQueue.main.async {
                self.updateModel()
            }
        }
    }
    var numOfCells: Int?{
        get{
            return albumResults?.results.count
        }
    }
    func fetchData(url: String){
        guard let url = URL(string: url)else{
            print("url returned nil")
            return
        }
        
        APIManager().getData(url: url, completion: {
            data in
            guard let data = data else{
                print("/modelView/albumModelView/  line29: data returned nil")
                return
            }
            do{
                let response = try JSONDecoder().decode(AlbumResponse.self, from: data)
                self.albumResults = response
            }
            catch
            {
                print("/modelView/albumModelView/  line29: error caught: \(error.localizedDescription)")
            }
        })
        
    }
    
}
