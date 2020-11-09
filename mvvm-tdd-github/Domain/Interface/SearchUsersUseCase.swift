//
//  SearchUsersUseCase.swift
//  mvvm-tdd-github
//
//  Created by jsshin on 2020/11/09.
//  Copyright © 2020 jsshin. All rights reserved.
//

import Foundation

protocol SearchUsersUseCase {
    func searchUsers(q: String, sort: String, order: String)
}
