//
//  MainTableViewController.swift
//  TableViewExercise
//
//  Created by Shaider John Abuel on 2022-06-23.
//

import UIKit

class MainTableViewController: UITableViewController {
  
  var items: [UserList] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchUsers()
  }
  
  @objc func fetchUsers(){
    if let refreshController = tableView.refreshControl,  !refreshController.isRefreshing { self.tableView.refreshControl?.beginRefreshing() }
    UserService.instance.getUsers { users in
      self.items = []
      self.items.append(UserList(headerTitle: "Header 1", users: users.suffix(3)))
      self.items.append(UserList(headerTitle: "Header 2", users: users.suffix(1)))
      self.items.append(UserList(headerTitle: "Header 3", users: users))
      self.tableView.reloadData()
      self.tableView.refreshControl?.endRefreshing()
    } onFailure: { msg in
      self.tableView.refreshControl?.endRefreshing()
    }
    
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = HeaderView.instantiate()
    headerView.titleLabel.text = self.items[section].headerTitle
    return headerView
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  self.items[section].users.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UserCell
    cell.configure(user: items[indexPath.section].users[indexPath.row])
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let controller = segue.destination as? CollectionController {
      controller.items = self.items[0].users
    }
  }
  
}

extension UIView {
  class func fromNib<T: UIView>() -> T {
    return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
  }
}
