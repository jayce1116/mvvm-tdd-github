//
//  StubHTTPSession.swift
//  mvvm-tdd-github
//
//  Created by jsshin on 2020/11/10.
//  Copyright © 2020 jsshin. All rights reserved.
//

import Foundation
import RxSwift

class StubHTTPSession: GithubRepository {
    
    var searchUsersCallCount = 0
    
    var searchItem: [SearchUserModel] = []
    
    func searchUsers(keyword: String, sort: String, order: String) -> Observable<[SearchUserModel]> {
        searchUsersCallCount += 1
        return .just(searchItem)
    }
}
