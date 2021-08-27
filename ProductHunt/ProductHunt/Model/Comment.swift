//
//  Comment.swift
//  ProductHunt
//
//  Created by Alberto Dominguez on 8/27/21.
//

import Foundation

struct Comment: Decodable {
 let id: Int
 let body: String
}

struct CommentApiResponse: Decodable {
   let comments: [Comment]
}
