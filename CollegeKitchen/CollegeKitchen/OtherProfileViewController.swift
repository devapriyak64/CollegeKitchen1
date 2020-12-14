//
//  OtherProfileViewController.swift
//  CollegeKitchen
//
//  Created by Jaden O'Brien on 12/12/20.
//

import UIKit

class OtherProfileViewController: UIViewController {

    var user: User!
    var profilePicture: UIImageView!
    var bio: UITextView!
    var username: UILabel!
    var friendsButton: UIButton!
    var addFriendButton: UIButton!
    var recipeCollectionView: UICollectionView!
    let recipeReuseIdentifier = "recipeReuseIdentifier"
    let recipePadding: CGFloat = 15
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1.00, green: 0.47, blue: 0.47, alpha: 1.00)
        
        profilePicture = UIImageView()
        profilePicture.image = user.user_pic
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.contentMode = .scaleAspectFill
        profilePicture.clipsToBounds = true
        view.addSubview(profilePicture)
        
        bio = UITextView()
        bio.text = user.user_bio
        bio.textColor = .black
        bio.backgroundColor = UIColor(red: 1.00, green: 0.47, blue: 0.47, alpha: 1.00)
        bio.textAlignment = .left
        bio.isEditable = false
        bio.isSelectable = false
        bio.font = UIFont.systemFont(ofSize: 14)
        bio.translatesAutoresizingMaskIntoConstraints = false
        bio.isScrollEnabled = true
        bio.showsVerticalScrollIndicator = true
        view.addSubview(bio)
        
        username = UILabel()
        username.text = "@"+user.username
        username.textColor = .black
        username.textAlignment = .right
        username.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        username.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(username)
        
        friendsButton = UIButton()
        friendsButton.translatesAutoresizingMaskIntoConstraints = false
        friendsButton.setTitle("Followers", for: .normal)
        friendsButton.setTitleColor(.black, for: .normal)
        friendsButton.backgroundColor = UIColor(red: 1.00, green: 0.47, blue: 0.47, alpha: 1.00)
        friendsButton.addTarget(self, action: #selector(pushFriends), for: .touchUpInside)
        friendsButton.layer.borderColor = UIColor.black.cgColor
        friendsButton.layer.borderWidth = 1
        friendsButton.layer.cornerRadius = 15.0
        view.addSubview(friendsButton)
        
        addFriendButton = UIButton()
        addFriendButton.translatesAutoresizingMaskIntoConstraints = false
        addFriendButton.setTitle(" + ", for: .normal)
        addFriendButton.setTitleColor(.black, for: .normal)
        addFriendButton.backgroundColor = UIColor(red: 1.00, green: 0.47, blue: 0.47, alpha: 1.00)
        addFriendButton.addTarget(self, action: #selector(pushAddFriend), for: .touchUpInside)
        addFriendButton.layer.borderColor = UIColor.black.cgColor
        addFriendButton.layer.borderWidth = 1
        addFriendButton.layer.cornerRadius = 15.0
        view.addSubview(addFriendButton)
        
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

 
        setupConstraints()
    }

    @objc func pushFriends() {
        let vc = FriendsViewController(user: user)
            navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func pushAddFriend() {
        print("Add Friends pushed") // TODO: make this add user to own friend list
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profilePicture.heightAnchor.constraint(equalToConstant: 80),
            profilePicture.widthAnchor.constraint(equalToConstant: 80),
            profilePicture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            profilePicture.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -21)
        ])
        
        NSLayoutConstraint.activate([
            bio.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor),
            bio.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            bio.trailingAnchor.constraint(equalTo: profilePicture.leadingAnchor, constant: -20),
            bio.heightAnchor.constraint(equalToConstant: 75)
        ])
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 10),
            username.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -21),
            username.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21)
        ])
        
        NSLayoutConstraint.activate([
            recipeCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            recipeCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            recipeCollectionView.topAnchor
                .constraint(equalTo: username.bottomAnchor, constant: 10),
            recipeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            friendsButton.centerXAnchor.constraint(equalTo: bio.centerXAnchor),
            friendsButton.widthAnchor.constraint(equalToConstant: 120),
            friendsButton.topAnchor.constraint(equalTo: bio.bottomAnchor, constant: 10),
            friendsButton.bottomAnchor.constraint(equalTo: recipeCollectionView.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            addFriendButton.centerYAnchor.constraint(equalTo: friendsButton.centerYAnchor),
            addFriendButton.widthAnchor.constraint(equalToConstant: 120),
            addFriendButton.topAnchor.constraint(equalTo: friendsButton.topAnchor),
            addFriendButton.leadingAnchor.constraint(equalTo: bio.leadingAnchor, constant: 15),
            addFriendButton.trailingAnchor.constraint(equalTo: friendsButton.leadingAnchor, constant: -15)
        ])
    }
}
extension OtherProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.user_posts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipeReuseIdentifier, for: indexPath) as! RecipeCollectionViewCell
            //cell.configure()
            return cell
        }

    }

extension OtherProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width - 2 * recipePadding
            let height = collectionView.frame.height/4
            return CGSize(width: width, height: height)
    }

}

extension OtherProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let post = user.user_posts[indexPath.row]
        let vc = RecipePopUpViewController(post: post)
            navigationController?.pushViewController(vc, animated: true)
        recipeCollectionView.reloadData()
    }
    

}



