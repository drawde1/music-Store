//
//  APIManager.swift
//  Music Store
//
//  Created by Rave Bizz on 6/22/21.
//

import Foundation

struct APIManager{
    func getData(url: URL,  completion: @escaping (Data?)-> Void){
        let task = URLSession.shared.dataTask(with: url, completionHandler: {d,r,e in
            completion(d)
        })
        task.resume()
    }
}
