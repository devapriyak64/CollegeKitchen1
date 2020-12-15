//
//  ViewController.swift
//  CollegeKitchen
//
//  Created by Vian Nguyen on 12/5/20.
//

import UIKit
import SnapKit

protocol SaveNewRecipeDelegate: class {
    func saveNewRecipe(post: Post)
}

class ViewController: UIViewController {

    var recipeCollectionView: UICollectionView!
    let recipeReuseIdentifier = "recipeReuseIdentifier"
    let recipePadding: CGFloat = 15

    var filterCollectionView: UICollectionView!
    let filterReuseIdentifier = "filterReuseIdentifier"
    let filterPadding: CGFloat = 8

    var homeButton: UIButton!
    var addRecipeButton: UIButton!
    var profileButton: UIButton!

    var trendingButton: UIButton!
    var followingButton: UIButton!
    
    var posts = [Post]()
    var filters: [Filter]!

    override func viewDidLoad() {
        super.viewDidLoad()
        filters = [Filter(name: "$"), Filter(name: "$$"), Filter(name: "$$$"), Filter(name: "Easy"), Filter(name: "Medium"), Filter(name: "Difficult")]

        view.backgroundColor = UIColor(red: 1.00, green: 0.47, blue: 0.47, alpha: 1.00)

        homeButton = UIButton()
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        //homeButton.setTitle("Home", for: .normal)
        homeButton.setTitleColor(.red, for: .normal)
        //homeButton.backgroundColor = .white
        homeButton.addTarget(self, action: #selector(pushHomeViewController), for: .touchUpInside)
        view.addSubview(homeButton)

        addRecipeButton = UIButton()
        addRecipeButton.translatesAutoresizingMaskIntoConstraints = false
        addRecipeButton.setTitle("Add Recipe", for: .normal)
        addRecipeButton.setTitleColor(.red, for: .normal)
        addRecipeButton.addTarget(self, action: #selector(presentAddRecipeViewController), for: .touchUpInside)
        view.addSubview(addRecipeButton)

        profileButton = UIButton()
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.setTitle("Profile", for: .normal)
        profileButton.setTitleColor(.red, for: .normal)
        profileButton.addTarget(self, action: #selector(pushProfileViewController), for: .touchUpInside)
        view.addSubview(profileButton)
        
        resetButtons()
        
        trendingButton = UIButton()
        trendingButton.translatesAutoresizingMaskIntoConstraints = false
        trendingButton.setTitle("Trending", for: .normal)
        trendingButton.setTitleColor(.black, for: .normal)
        //trendingButton.backgroundColor = .white
        trendingButton.addTarget(self, action: #selector(showTrendingRecipes), for: .touchUpInside)
        trendingButton.snp.makeConstraints { make in
            make.width.equalTo(180)
        }
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: trendingButton)
        
        followingButton = UIButton()
        followingButton.translatesAutoresizingMaskIntoConstraints = false
        followingButton.setTitle("Following", for: .normal)
        followingButton.setTitleColor(.black, for: .normal)
        //followingButton.backgroundColor = .white
        followingButton.addTarget(self, action: #selector(showFollowingRecipes), for: .touchUpInside)
        
        followingButton.snp.makeConstraints { make in
            make.width.equalTo(180)
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: followingButton)
        

        let recipeLayout = UICollectionViewFlowLayout()
        recipeLayout.minimumInteritemSpacing = recipePadding
        recipeLayout.minimumLineSpacing = recipePadding
        recipeLayout.scrollDirection = .vertical

        recipeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: recipeLayout)
        recipeCollectionView.backgroundColor = .white
        recipeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        recipeCollectionView.dataSource = self
        recipeCollectionView.delegate = self
        recipeCollectionView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: recipeReuseIdentifier)
        recipeCollectionView.contentInset = UIEdgeInsets(top: recipePadding, left: 0, bottom: recipePadding, right: 0);
        view.addSubview(recipeCollectionView)

        let filterLayout = UICollectionViewFlowLayout()
        filterLayout.minimumInteritemSpacing = filterPadding
        filterLayout.minimumLineSpacing = filterPadding
        filterLayout.scrollDirection = .horizontal

        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
        filterCollectionView.backgroundColor = .lightGray
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterReuseIdentifier)
        filterCollectionView.contentInset = UIEdgeInsets(top: 0, left: filterPadding, bottom: 0, right: filterPadding);
        view.addSubview(filterCollectionView)


        setupConstraints()
        getPosts()

    }
    
    func setupConstraints() {
        recipeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(filterCollectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
        filterCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            let navBarHeight = UIApplication.shared.statusBarFrame.size.height +
                     (navigationController?.navigationBar.frame.height ?? 100.0)
            print(navBarHeight)
            make.top.equalToSuperview().offset(navBarHeight)
            make.height.equalTo(50)
        }

        homeButton.snp.makeConstraints { make in
            make.top.equalTo(addRecipeButton.snp.top)
            make.centerX.equalTo(view.frame.width/5)
            make.centerY.equalTo(addRecipeButton.snp.centerY)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        addRecipeButton.snp.makeConstraints { make in
            make.top.equalTo(recipeCollectionView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
            make.width.equalTo(40)
            make.height.equalTo(30)
        }
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(addRecipeButton.snp.top)
            make.centerX.equalTo(view.frame.width * 4/5)
            make.centerY.equalTo(addRecipeButton.snp.centerY)
            make.width.equalTo(40)
            make.height.equalTo(40)

        }
    }
    
    func getPosts() {
        NetworkManager.getAllPosts { posts in
            self.posts = posts
            DispatchQueue.main.async {
                  self.recipeCollectionView.reloadData()
                }
        }
    }
    
    func resetButtons() {
        navigationController?.navigationBar.barTintColor = UIColor.lightGray
        let addRecipeButtonImage = UIImage(named: "plus_black")
        addRecipeButton.setImage(addRecipeButtonImage , for: .normal)
        let profileButtonImage = UIImage(named: "profile_black")
        profileButton.setImage(profileButtonImage , for: .normal)
        let homeButtonImage = UIImage(named: "home_black")
        homeButton.setImage(homeButtonImage , for: .normal)
    }
    
    @objc func presentAddRecipeViewController() {
        resetButtons()
        let addRecipeButtonImage = UIImage(named: "plus_white")
        addRecipeButton.setImage(addRecipeButtonImage , for: .normal)
        let vc = AddRecipeViewController(delegate: self, recipe: posts[0])
        // vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func pushHomeViewController() {
        resetButtons()
        let homeButtonImage = UIImage(named: "home_white")
        homeButton.setImage(homeButtonImage , for: .normal)
    }
    @objc func pushProfileViewController() {
        resetButtons()
        let profileButtonImage = UIImage(named: "profile_white")
        profileButton.setImage(profileButtonImage , for: .normal)
        // temporary user, will be replaced by networked information
        let user0 = User(user_id: "11", username: "Walker White", password: "cat", user_pic: UIImage(named: "walker.jpeg")!, user_bio: "Chef on the weekend.", user_posts: [], followers: [], following: [])
        let user1 = User(user_id: "123", username: "gordonramsey", password: "password", user_pic: UIImage(named: "gordon.jpeg")!, user_bio: "Multi-Michelin starred chef. Star of the small screen. Owner of successful restaurants across the globe.", user_posts: [], followers: [user0], following: [])
        let vc = PersonalProfileViewController(user: user1)
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func showTrendingRecipes() {
        print("trending")
        if trendingButton.titleLabel?.font == UIFont(name: "HelveticaNeue-Bold", size: 18.0) {
            trendingButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 18.0)
        } else {
            trendingButton.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        }
        
    }
    @objc func showFollowingRecipes() {
        print("following")
        if followingButton.titleLabel?.font == UIFont(name: "HelveticaNeue-Bold", size: 18.0) {
            followingButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 18.0)
        } else {
            followingButton.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        }
    }


}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == recipeCollectionView {
            return posts.count
        } else {
            return filters.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recipeCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipeReuseIdentifier, for: indexPath) as! RecipeCollectionViewCell
            cell.configure(post: posts[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
            cell.configure(filter: filters[indexPath.row])
            return cell

        }

    }


}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == recipeCollectionView {
            let width = collectionView.frame.width - 2 * recipePadding
            let height = collectionView.frame.height/4
            return CGSize(width: width, height: height)
        } else {
            let width = (collectionView.frame.width - 2 * filterPadding) / 6.0
            let height = collectionView.frame.height - 2 * filterPadding

            if filters[indexPath.row].name.count > 0 {
                let label = filters[indexPath.row].nameLabel
                return CGSize(width: label!.frame.width + 2 * filterPadding, height: height)

            }

            return CGSize(width: width, height: height)
        }
    }

}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == recipeCollectionView {
            let post = posts[indexPath.row]
            let vc = RecipePopUpViewController(post: post)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            print("filter pressed")
            if filters[indexPath.row].didSelect == false {
                filters[indexPath.row].didSelect = true
            } else {
                filters[indexPath.row].didSelect = false
            }
        }
        recipeCollectionView.reloadData()
        filterCollectionView.reloadData()
    }
}

    
extension ViewController: SaveNewRecipeDelegate {
        func saveNewRecipe(post: Post) {
            posts[0] = post
            recipeCollectionView.reloadData()
    }

}



