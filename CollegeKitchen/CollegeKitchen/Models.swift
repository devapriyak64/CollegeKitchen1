//
//  Models.swift
//  CollegeKitchen
//
//  Created by Vian Nguyen on 12/13/20.
//

import UIKit
import Foundation

struct Post: Codable {
    var post_id: Int
    var title: String
    var dateTime: String
    var ingredients: String
    var recipe: String
    var recipeTime: Int
    var difficultyRating: String
    var overallRating: Int
    var priceRating: String
    var user_di: Int
    var comments: [String]
    var photos: [String]
}
struct Tag {
    var tag_id: Int
    var tag_name: String
    var posts: String
}

struct PostResponse: Codable {
    
    var posts: [Post]
}

struct Response<T:Codable>: Codable { 
    
    var success: Bool
    var data: T
    
}

struct User {
    var user_id: String
    var username: String
    var password: String
    var user_pic: UIImage
    var user_bio: String
    var user_posts: [Post]
    var followers: [User]
    var following: [User]
}
