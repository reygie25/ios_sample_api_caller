//
//  UserService.swift
//  TableViewExercise
//
//  Created by Shaider John Abuel on 2022-06-23.
//

import Foundation
import Alamofire

class UserService: WebApi {
  
  static var _instance = { UserService() }
  static var instance: UserService { return _instance() }
  
  func getUsers(onSuccess: @escaping ([User])->Void, onFailure: @escaping (String)->Void){
    let url = buildUrl(["users"])
    AF.request(url).responseDecodable(of: [User].self) { response in
      switch response.result {
      case .success(let users):
        onSuccess(users)
      case .failure(let error):
        onFailure(error.localizedDescription)
      }
    }
    
  }
  
  
}

