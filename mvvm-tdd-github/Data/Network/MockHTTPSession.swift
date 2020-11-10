//
//  MockHTTPSession.swift
//  mvvm-tdd-github
//
//  Created by jsshin on 2020/11/10.
//  Copyright © 2020 jsshin. All rights reserved.
//

import Foundation

class MockHTTPSession: GithubRepository {
    
    var searchUsersCallCount = 0
    
    func searchUsers(keyword: String, sort: String, order: String) {
        searchUsersCallCount += 1
    }
}
