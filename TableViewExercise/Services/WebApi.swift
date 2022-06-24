//
//  WebApi.swift
//  TableViewExercise
//
//  Created by Shaider John Abuel on 2022-06-23.
//

import Foundation

class WebApi {
  
  private class var domain: String {
    return "jsonplaceholder.typicode.com"
  }
  
  func buildUrl(_ paths: [String]) -> String {
    var url = "https://\(WebApi.domain)"
    for path in paths {
      url += "/\(path)"
    }
    return url
  }
  
  
}
