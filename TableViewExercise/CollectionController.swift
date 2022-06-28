//
//  CollectionController.swift
//  TableViewExercise
//
//  Created by Shaider John Abuel on 2022-06-27.
//

import UIKit


class CollectionController: UICollectionViewController {
  
  var items: [User] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("called")
  }

  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCollectionCell
    cell.configure(user: self.items[indexPath.row])
    return cell
  }
  
  
}
