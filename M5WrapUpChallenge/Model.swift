//
//  Model.swift
//  M5WrapUpChallenge
//
//  Created by Craig on 2/22/23.
//

import Foundation

struct Video: Decodable, Identifiable {
    
    var id: Int
    var title: String
    var url: String
}
