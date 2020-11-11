//
//  StubSearchUsersUseCase.swift
//  mvvm-tdd-github
//
//  Created by jsshin on 2020/11/11.
//  Copyright © 2020 jsshin. All rights reserved.
//

import Foundation
import RxSwift

class StubSearchUsersUseCase: SearchUsersUseCase {
    
    var searchUsersCallsCount = 0
    
    var result: [SearchUserModel] = []
    
    func searchUsers(keyword: String, sort: String, order: String) -> Observable<[SearchUserModel]> {
        searchUsersCallsCount += 1
        return .just(result)
    }
    
}
