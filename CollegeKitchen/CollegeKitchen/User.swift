//
//  User.swift
//  CollegeKitchen
//
//  Created by Jaden O'Brien on 12/12/20.
//

import UIKit
import Foundation

class User {
    var user_id: String
    var username: String
    var password: String
    var user_pic: UIImage
    var user_bio: String
    var user_posts: [Recipe]
    var followers: [User]
    var following: [User]
    
    init(user_id: String, username: String, password: String, user_pic: UIImage, user_bio: String, user_posts: [Recipe], followers: [User], following: [User]) {
        self.user_id = user_id
        self.username = username
        self.password = password
        self.user_pic = user_pic
        self.user_bio = user_bio
        self.user_posts = user_posts
        self.followers = followers
        self.following = following
    }
}
