//
//  ViewController.swift
//  TableViewExercise
//
//  Created by Shaider John Abuel on 2022-06-23.
//

import UIKit

class MainController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  private let refreshControl = UIRefreshControl()
  let service = UserService.instance
  var items: [User] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if #available(iOS 10.0, *) {
      tableView.refreshControl = refreshControl
    } else {
      tableView.addSubview(refreshControl)
    }
    refreshControl.addTarget(self, action: #selector(fetchUsers), for: .valueChanged)
    fetchUsers()
  }
  
  @objc func fetchUsers(){
    if !refreshControl.isRefreshing { refreshControl.beginRefreshing() }
    service.getUsers { users in
      self.items = users
      self.tableView.reloadData()
      self.refreshControl.endRefreshing()
    } onFailure: { msg in
      print(msg)
      self.refreshControl.endRefreshing()
    }

  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    cell?.textLabel?.text = items[indexPath.row].name
    cell?.detailTextLabel?.text = items[indexPath.row].address.fullAddress
    return cell!
  }
  
}
