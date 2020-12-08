//
//  ViewController.swift
//  CollegeKitchen
//
//  Created by Vian Nguyen on 12/5/20.
//

import UIKit
import SnapKit

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

    var recipes: [Recipe]!
    var filters: [Filter]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // TODO: Hard coded recipes are temporary, this should be replaced by networked recipes later
        let pestopasta = Recipe(image: UIImage(named: "pestopasta.jpg")!, recipeTitle: "Pesto Pasta", username: "Jeremy Scheck", shortDescription: "Anyone can make a Pesto Pasta, but not everyone knows how to make a pesto pasta that’s slick with plenty of pesto sauce without adding tons of extra oil! Here’s how I make it.", ingredients: "- Onion\n- Pesto\n- Olive Oil\n- Ziti\n - Parmesan\n- Salt\n- Pepper", steps: "1. Bring a pot of lightly salted water to a rolling boil; cook the fettuccini at a boil until cooked through yet firm to the bite, about 8 minutes; drain. Transfer the fettuccini to a bowl.\n2. Melt the butter in a saucepan over medium heat. Cook the garlic and pesto in the melted butter until warmed, 2 to 3 minutes; pour over the fettuccini and toss to coat.\n3. Season to taste using salt and pepper.")
        let oatmeal = Recipe(image: UIImage(named: "oatmeal.jpg")!, recipeTitle: "Overnight Oats", username: "Joe Shmoe", shortDescription: "Overnight oats are a simple no-cook way of making oatmeal by soaking oats in milk for several hours (usually overnight). You can either eat them cold straight from the jar, or heat them up to achieve something similar to freshly cooked oatmeal.", ingredients: "- Rolled Oats\n-Milk of your choice\n- Fruit, Raisins, Yogurt, etc.", steps: "1. Take a glass or a bowl and add a serving of old fashioned rolled oats.\n2. Fill up the glass with liquid until the oats are well covered.\n3. Add your favorite toppings.")
        let guac = Recipe(image: UIImage(named: "guac.jpeg")!, recipeTitle: "Dorm Room Guac", username: "Walker White", shortDescription: "Make a bowl of guac in less than 10 minutes with items you probably already have in your dorm room!", ingredients: "- Avocado\n- Salt\n- Pepper\n- Lime Juice\n- Tomata", steps: "1. Scoop out the inside of the avocado and chop until smooth.\n2. Add salt, pepper, and lime juice.\n4. Chop tomato into small pieces and add to mixture.\n4. Mix with a spoon and serve!")
        recipes = [pestopasta, oatmeal, guac]
        filters = [Filter(name: "$"), Filter(name: "$$"), Filter(name: "$$$"), Filter(name: "Easy"), Filter(name: "Medium"), Filter(name: "Difficult")]

        view.backgroundColor = .lightGray
//        pushNavViewControllerButton = UIButton()
//        pushNavViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
//        pushNavViewControllerButton.setTitle("Red Square Arena", for: .normal)
//        pushNavViewControllerButton.setTitleColor(.red, for: .normal)
//        pushNavViewControllerButton.backgroundColor = .white
//        pushNavViewControllerButton.layer.cornerRadius = 4
//        pushNavViewControllerButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
//        view.addSubview(pushNavViewControllerButton)

        homeButton = UIButton()
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.setTitle("Home", for: .normal)
        homeButton.setTitleColor(.red, for: .normal)
        homeButton.backgroundColor = .white
        homeButton.addTarget(self, action: #selector(pushHomeViewController), for: .touchUpInside)
        view.addSubview(homeButton)

        addRecipeButton = UIButton()
        addRecipeButton.translatesAutoresizingMaskIntoConstraints = false
        addRecipeButton.setTitle("Add Recipe", for: .normal)
        addRecipeButton.setTitleColor(.red, for: .normal)
        addRecipeButton.backgroundColor = .white
        addRecipeButton.addTarget(self, action: #selector(pushAddRecipeController), for: .touchUpInside)
        view.addSubview(addRecipeButton)

        profileButton = UIButton()
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.setTitle("Profile", for: .normal)
        profileButton.setTitleColor(.red, for: .normal)
        profileButton.backgroundColor = .white
        profileButton.addTarget(self, action: #selector(pushProfileViewController), for: .touchUpInside)
        view.addSubview(profileButton)

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
        view.addSubview(recipeCollectionView)

        let filterLayout = UICollectionViewFlowLayout()
        filterLayout.minimumInteritemSpacing = filterPadding
        filterLayout.minimumLineSpacing = filterPadding
        filterLayout.scrollDirection = .horizontal

        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
        filterCollectionView.backgroundColor = .green
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterReuseIdentifier)
        view.addSubview(filterCollectionView)


        setupConstraints()

    }
    func setupConstraints() {
        recipeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(filterCollectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
        filterCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(filterPadding)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(50)
        }

        homeButton.snp.makeConstraints { make in
            make.top.equalTo(addRecipeButton.snp.top)
            make.centerY.equalTo(addRecipeButton.snp.centerY)
            //make.centerXWithinMargins(view.snp.leading, addRecipeButton.snp.leading)
        }
        addRecipeButton.snp.makeConstraints { make in
            make.top.equalTo(recipeCollectionView.snp.bottom)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
        }
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(addRecipeButton.snp.top)
            make.centerY.equalTo(addRecipeButton.snp.centerY)

        }
    }

    @objc func pushAddRecipeController() {
//        let newViewController = AddRecipeController()
//        newViewController.delegate = self
//        navigationController?.pushViewController(newViewController, animated: true)
    }
    @objc func pushHomeViewController() {

    }
    @objc func pushProfileViewController() {

    }


}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == recipeCollectionView {
            return 10
        } else {
            return filters.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recipeCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipeReuseIdentifier, for: indexPath) as! RecipeCollectionViewCell
            cell.configure()
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
            // TODO: this causes an error if you choose a cell without recipe
            let recipe = recipes[indexPath.row]
            let vc = RecipePopUpViewController(recipe: recipe)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            print("filter pressed")
        }
        recipeCollectionView.reloadData()
        filterCollectionView.reloadData()
    }
}


