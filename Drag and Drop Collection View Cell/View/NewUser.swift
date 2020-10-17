//
//  ViewController.swift
//  Expense Tracker
//
//  Created by MAK on 10/2/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

class NewUser: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var itemsCollection: UICollectionView!
    var colors = [#colorLiteral(red: 0.9950413108, green: 0.891050756, blue: 0.8802576661, alpha: 1), #colorLiteral(red: 0.8881729841, green: 0.9284433722, blue: 0.9814594388, alpha: 1), #colorLiteral(red: 0.9943444133, green: 0.9553429484, blue: 0.7900375724, alpha: 1)]
    var textColors = [#colorLiteral(red: 0.9807383418, green: 0.3547240496, blue: 0.2494294345, alpha: 1), #colorLiteral(red: 0.2373621166, green: 0.5656934381, blue: 1, alpha: 1), #colorLiteral(red: 0.815675199, green: 0.7224796414, blue: 0.2462825477, alpha: 1)]
    var texts = ["Travel", "Restaurant", "Shoping"]
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsCollection.dataSource = self
        itemsCollection.delegate = self
        self.itemsCollection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        itemsCollection.addGestureRecognizer(gesture)
    }
    @objc func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        guard let cell = itemsCollection  else {
            return
        }
        switch gesture.state {
        case .began:
            guard let index = cell.indexPathForItem(at: gesture.location(in: cell))  else {
                return
            }
            cell.beginInteractiveMovementForItem(at: index)
        case .changed:
            cell.updateInteractiveMovementTargetPosition(gesture.location(in: cell))
        case .ended:
            cell.endInteractiveMovement()
        default:
            cell.cancelInteractiveMovement()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell else {
            fatalError("Error")
        }
        cell.view.backgroundColor = colors[indexPath.row]
        cell.text.text = texts[indexPath.row]
        cell.text.textColor = textColors[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = colors.remove(at: sourceIndexPath.row)
        let textColor = textColors.remove(at: sourceIndexPath.row)
        let text = texts.remove(at: sourceIndexPath.row)
        textColors.insert(textColor, at: destinationIndexPath.row)
        texts.insert(text, at: destinationIndexPath.row)
        colors.insert(item, at: destinationIndexPath.row)
    }
}
