//
//  AlbumModel.swift
//  Music Store
//
//  Created by Rave Bizz on 6/22/21.
//

import Foundation


struct AlbumResponse: Codable{
    let results: [AlbumData]
}
struct AlbumData: Codable{
    let collectionPrice: Float?
    let collectionName: String
    let artworkUrl100: String
}
