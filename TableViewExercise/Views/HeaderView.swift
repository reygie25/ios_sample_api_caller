//
//  HeaderView.swift
//  TableViewExercise
//
//  Created by Shaider John Abuel on 2022-06-27.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView, NibInstantiatable {
  
  class var nibName: String { return "HeaderView" }
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBAction func tap() {
    print("tap")
  }
  
}

public protocol Instantiatable {
}

extension Instantiatable {
  
  static var bundle: Bundle? {
    return Bundle(for: Self.self as! AnyClass)
  }
  
}


public protocol NibInstantiatable: Instantiatable {
  
  static var nibName: String { get }
  
}

public extension NibInstantiatable {
  
  static func instantiate() -> Self {
    return UINib(nibName: nibName, bundle: bundle)
      .instantiate(withOwner: nil, options: nil).first as! Self
  }
  
}
