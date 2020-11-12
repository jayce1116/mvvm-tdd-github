//
//  HTTPSession.swift
//  mvvm-tdd-github
//
//  Created by jsshin on 2020/11/10.
//  Copyright © 2020 jsshin. All rights reserved.
//

import Foundation
import RxSwift

class HTTPSession: GithubRepository {
    
    static let shared = HTTPSession()
    
    private init() {
        
    }
    
    func searchUsers(keyword: String, sort: String, order: String) -> Observable<[SearchUserModel]> {
        return .just([])
    }
    
}
