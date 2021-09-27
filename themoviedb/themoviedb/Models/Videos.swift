//
//  Videos.swift
//  themoviedb
//
//  Created by Luis Rodríguez López on 27/09/21.
//

import Foundation



struct VideosModel : Decodable{
   var listVideos : [Video]!
    
    enum CodingKeys: String, CodingKey {
           case listVideos = "results"
    }
    init() { }
}

struct Video : Decodable{
    var name : String!
    var key : String!
    var site : String!
    
}

