//
//  FriendsViewController.swift
//  CollegeKitchen
//
//  Created by Jaden O'Brien on 12/13/20.
//

import UIKit

class FriendsViewController: UIViewController {

    var user: User!
    var friendsCollectionView: UICollectionView!
    let friendsReuseIdentifier = "recipeReuseIdentifier"
    let friendsPadding: CGFloat = 15
    
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
        
        let friendsLayout = UICollectionViewFlowLayout()
        friendsLayout.minimumInteritemSpacing = friendsPadding
        friendsLayout.minimumLineSpacing = friendsPadding
        friendsLayout.scrollDirection = .vertical
        
        friendsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: friendsLayout)
        friendsCollectionView.backgroundColor = .white
        friendsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        friendsCollectionView.dataSource = self
        friendsCollectionView.delegate = self
        friendsCollectionView.register(FriendsCollectionViewCell.self, forCellWithReuseIdentifier: friendsReuseIdentifier)
        friendsCollectionView.contentInset = UIEdgeInsets(top: friendsPadding, left: 0, bottom: friendsPadding, right: 0);
        view.addSubview(friendsCollectionView)

 
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            friendsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            friendsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            friendsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            friendsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

}

extension FriendsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.followers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: friendsReuseIdentifier, for: indexPath) as! FriendsCollectionViewCell
        cell.configure(for: user.followers[indexPath.row])
            return cell
        }

    }

extension FriendsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width - 2 * friendsPadding
            let height = collectionView.frame.height/6
            return CGSize(width: width, height: height)
    }

}

extension FriendsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let friend = user.followers[indexPath.row]
        let vc = OtherProfileViewController(user: friend)
            navigationController?.pushViewController(vc, animated: true)
        friendsCollectionView.reloadData()
    }
    

}

