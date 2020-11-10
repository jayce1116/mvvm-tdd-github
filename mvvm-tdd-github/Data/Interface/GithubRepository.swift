//
//  GithubRepository.swift
//  mvvm-tdd-github
//
//  Created by jsshin on 2020/11/10.
//  Copyright © 2020 jsshin. All rights reserved.
//

import Foundation
import RxSwift

protocol GithubRepository {
    func searchUsers(keyword: String, sort: String, order: String)
}
