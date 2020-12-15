//
//  NetworkManager.swift
//  CollegeKitchen
//
//  Created by Vian Nguyen on 12/13/20.
//

import Foundation
import Alamofire

class NetworkManager {

    private static let endpoint = "http://collegekitchenapp.herokuapp.com"
    
    static func getAllPosts(completion: @escaping ([Post]) -> Void) {
        let newEndpoint = endpoint + "/posts/"
        AF.request(newEndpoint, method: .get).validate().responseData { response in
            print("one")
            switch response.result {
            case .success(let data):
                print("two")
                let jsonDecoder = JSONDecoder()
                //jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let postData = try? jsonDecoder.decode(Response<PostResponse>.self, from: data) {
                    print(postData.data)
                        let posts = postData.data
                        completion(posts)
                }
                else {print ("boooo")}
            case .failure(let error):
                print("three")
                print(error.localizedDescription)
            }
        }
    }
//    
//    static func getFollowingPosts(completion: @escaping ([Post]) -> Void) {
//        let newEndpoint =  endpoint + "/user/<int:user_id>/following/posts/"
//        AF.request(newEndpoint, method: .get).validate().responseData { response in
//            switch response.result {
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                //jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//                
//                if let postData = try? jsonDecoder.decode(Response<PostResponse>.self, from: data) {
//                    if postData.success {
//                        let posts = postData.data.posts
//                        completion(posts)
//                    }
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//    static func getPostsByTag(completion: @escaping ([Post]) -> Void) {
//        let newEndpoint = "/posts/tags"
//        AF.request(newEndpoint, method: .get).validate().responseData { response in
//            switch response.result {
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                //jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//                
//                if let postData = try? jsonDecoder.decode(Response<PostResponse>.self, from: data) {
//                    if postData.success {
//                        let posts = postData.data.posts
//                        completion(posts)
//                    }
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
}
    
    
    
