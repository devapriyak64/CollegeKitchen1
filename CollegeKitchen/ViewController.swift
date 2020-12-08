//
//  ViewController.swift
//  CollegeKitchen
//
//  Created by Jaden O'Brien on 12/5/20.
//

import UIKit

class ViewController: UIViewController {
    
    var pushRecipePopUpButton: UIButton!
    
    let pestopasta = Recipe(image: UIImage(named: "pestopasta.jpg")!, recipeTitle: "Pesto Pasta", username: "Jeremy Scheck", shortDescription: "Anyone can make a Pesto Pasta, but not everyone knows how to make a pesto pasta that’s slick with plenty of pesto sauce without adding tons of extra oil! Here’s how I make it.", ingredients: "- Onion\n- Pesto\n- Olive Oil\n- Ziti\n - Parmesan\n- Salt\n- Pepper", steps: "1. Bring a pot of lightly salted water to a rolling boil; cook the fettuccini at a boil until cooked through yet firm to the bite, about 8 minutes; drain. Transfer the fettuccini to a bowl.\n2. Melt the butter in a saucepan over medium heat. Cook the garlic and pesto in the melted butter until warmed, 2 to 3 minutes; pour over the fettuccini and toss to coat.\n3. Season to taste using salt and pepper.")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // title = "Temporary Feed Page"
        
        // temporary button, will be replaced by recipes in UITableView or UICollectionView
        pushRecipePopUpButton = UIButton()
        pushRecipePopUpButton.translatesAutoresizingMaskIntoConstraints = false
        pushRecipePopUpButton.setTitle("Click for Recipe", for: .normal)
        pushRecipePopUpButton.setTitleColor(.black, for: .normal)
        pushRecipePopUpButton.addTarget(self, action: #selector(pushRecipePopUp), for: .touchUpInside)
        view.addSubview(pushRecipePopUpButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            pushRecipePopUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushRecipePopUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushRecipePopUpButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    @objc func pushRecipePopUp() {
        let vc = RecipePopUpViewController(recipe: pestopasta)
        navigationController?.pushViewController(vc, animated: true)
    }


}

////
////  ViewController.swift
////  CollegeKitchen
////
////  Created by Vian Nguyen on 12/5/20.
////
//
//import UIKit
//import SnapKit
//
//class ViewController: UIViewController {
//
//    var recipeCollectionView: UICollectionView!
//    let recipeReuseIdentifier = "recipeReuseIdentifier"
//    let recipePadding: CGFloat = 15
//
//    var filterCollectionView: UICollectionView!
//    let filterReuseIdentifier = "filterReuseIdentifier"
//    let filterPadding: CGFloat = 8
//
//    var homeButton: UIButton!
//    var addRecipeButton: UIButton!
//    var profileButton: UIButton!
//
//    var recipes: [Recipe]!
//    var filters: [Filter]!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        recipes = []
//        filters = [Filter(name: "$"), Filter(name: "$$"), Filter(name: "$$$"), Filter(name: "Easy"), Filter(name: "Medium"), Filter(name: "Difficult")]
//
//        view.backgroundColor = .lightGray
////        pushNavViewControllerButton = UIButton()
////        pushNavViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
////        pushNavViewControllerButton.setTitle("Red Square Arena", for: .normal)
////        pushNavViewControllerButton.setTitleColor(.red, for: .normal)
////        pushNavViewControllerButton.backgroundColor = .white
////        pushNavViewControllerButton.layer.cornerRadius = 4
////        pushNavViewControllerButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
////        view.addSubview(pushNavViewControllerButton)
//
//        homeButton = UIButton()
//        homeButton.translatesAutoresizingMaskIntoConstraints = false
//        homeButton.setTitle("Home", for: .normal)
//        homeButton.setTitleColor(.red, for: .normal)
//        homeButton.backgroundColor = .white
//        homeButton.addTarget(self, action: #selector(pushHomeViewController), for: .touchUpInside)
//        view.addSubview(homeButton)
//
//        addRecipeButton = UIButton()
//        addRecipeButton.translatesAutoresizingMaskIntoConstraints = false
//        addRecipeButton.setTitle("Add Recipe", for: .normal)
//        addRecipeButton.setTitleColor(.red, for: .normal)
//        addRecipeButton.backgroundColor = .white
//        addRecipeButton.addTarget(self, action: #selector(pushAddRecipeController), for: .touchUpInside)
//        view.addSubview(addRecipeButton)
//
//        profileButton = UIButton()
//        profileButton.translatesAutoresizingMaskIntoConstraints = false
//        profileButton.setTitle("Profile", for: .normal)
//        profileButton.setTitleColor(.red, for: .normal)
//        profileButton.backgroundColor = .white
//        profileButton.addTarget(self, action: #selector(pushProfileViewController), for: .touchUpInside)
//        view.addSubview(profileButton)
//
//        let recipeLayout = UICollectionViewFlowLayout()
//        recipeLayout.minimumInteritemSpacing = recipePadding
//        recipeLayout.minimumLineSpacing = recipePadding
//        recipeLayout.scrollDirection = .vertical
//
//        recipeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: recipeLayout)
//        recipeCollectionView.backgroundColor = .white
//        recipeCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        recipeCollectionView.dataSource = self
//        recipeCollectionView.delegate = self
//        recipeCollectionView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: recipeReuseIdentifier)
//        view.addSubview(recipeCollectionView)
//
//        let filterLayout = UICollectionViewFlowLayout()
//        filterLayout.minimumInteritemSpacing = filterPadding
//        filterLayout.minimumLineSpacing = filterPadding
//        filterLayout.scrollDirection = .horizontal
//
//        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
//        filterCollectionView.backgroundColor = .green
//        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        filterCollectionView.dataSource = self
//        filterCollectionView.delegate = self
//        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterReuseIdentifier)
//        view.addSubview(filterCollectionView)
//
//
//        setupConstraints()
//
//    }
//    func setupConstraints() {
//        recipeCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(filterCollectionView.snp.bottom)
//            make.leading.trailing.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-100)
//        }
//        filterCollectionView.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(filterPadding)
//            make.trailing.equalToSuperview()
//            make.top.equalToSuperview().offset(100)
//            make.height.equalTo(50)
//        }
//
//        homeButton.snp.makeConstraints { make in
//            make.top.equalTo(addRecipeButton.snp.top)
//            make.centerY.equalTo(addRecipeButton.snp.centerY)
//            //make.centerXWithinMargins(view.snp.leading, addRecipeButton.snp.leading)
//        }
//        addRecipeButton.snp.makeConstraints { make in
//            make.top.equalTo(recipeCollectionView.snp.bottom)
//            make.centerX.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-50)
//        }
//        profileButton.snp.makeConstraints { make in
//            make.top.equalTo(addRecipeButton.snp.top)
//            make.centerY.equalTo(addRecipeButton.snp.centerY)
//
//        }
//    }
//
//    @objc func pushAddRecipeController() {
////        let newViewController = AddRecipeController()
////        newViewController.delegate = self
////        navigationController?.pushViewController(newViewController, animated: true)
//    }
//    @objc func pushHomeViewController() {
//
//    }
//    @objc func pushProfileViewController() {
//
//    }
//
//
//}
//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == recipeCollectionView {
//            return 10
//        } else {
//            return filters.count
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == recipeCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipeReuseIdentifier, for: indexPath) as! RecipeCollectionViewCell
//            cell.configure()
//            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
//            cell.configure(filter: filters[indexPath.row])
//            return cell
//
//        }
//
//    }
//
//
//}
//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == recipeCollectionView {
//            let width = collectionView.frame.width - 2 * recipePadding
//            let height = collectionView.frame.height/4
//            return CGSize(width: width, height: height)
//        } else {
//            let width = (collectionView.frame.width - 2 * filterPadding) / 6.0
//            let height = collectionView.frame.height - 2 * filterPadding
//
//            if filters[indexPath.row].name.count > 0 {
//                let label = filters[indexPath.row].nameLabel
//                return CGSize(width: label!.frame.width + 2 * filterPadding, height: height)
//
//            }
//
//            return CGSize(width: width, height: height)
//        }
//    }
//
//}
//extension ViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionView == recipeCollectionView {
//            print("recipe pressed")
//        } else {
//            print("filter pressed")
//        }
//        recipeCollectionView.reloadData()
//        filterCollectionView.reloadData()
//    }
//}
//
//
