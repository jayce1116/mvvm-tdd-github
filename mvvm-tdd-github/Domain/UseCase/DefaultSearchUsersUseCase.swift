//
//  DefaultSearchUsersUseCase.swift
//  mvvm-tdd-github
//
//  Created by jsshin on 2020/11/09.
//  Copyright © 2020 jsshin. All rights reserved.
//

import Foundation
import RxSwift

class DefaultSearchUsersUseCase: SearchUsersUseCase {
    
    private let repo: GithubRepository
    
    init(repo: GithubRepository) {
        self.repo = repo
    }
    
    func searchUsers(keyword: String, sort: String, order: String) -> Observable<[SearchUserModel]> {
        return self.repo.searchUsers(keyword: keyword, sort: sort, order: order)
    }
    
}
