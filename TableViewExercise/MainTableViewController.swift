//
//  MainTableViewController.swift
//  TableViewExercise
//
//  Created by Shaider John Abuel on 2022-06-23.
//

import UIKit

class MainTableViewController: UITableViewController {
  
  var items: [User] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchUsers()
  }
  
  @objc func fetchUsers(){
    if let refreshController = tableView.refreshControl,  !refreshController.isRefreshing { self.tableView.refreshControl?.beginRefreshing() }
    UserService.instance.getUsers { users in
      self.items = users
      self.tableView.reloadData()
      self.tableView.refreshControl?.endRefreshing()
    } onFailure: { msg in
      self.tableView.refreshControl?.endRefreshing()
    }
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UserCell
    cell.configure(user: items[indexPath.row])
    return cell
  }
  
}
