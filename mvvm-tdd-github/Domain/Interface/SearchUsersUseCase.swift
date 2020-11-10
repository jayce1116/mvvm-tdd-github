//
//  SearchUsersUseCase.swift
//  mvvm-tdd-github
//
//  Created by jsshin on 2020/11/09.
//  Copyright © 2020 jsshin. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchUsersUseCase {
    func searchUsers(keyword: String, sort: String, order: String) -> Observable<[SearchUserModel]>
}
