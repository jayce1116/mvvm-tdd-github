//
//  TestSearchUserUseCase.swift
//  mvvm-tdd-githubTests
//
//  Created by jsshin on 2020/11/10.
//  Copyright © 2020 jsshin. All rights reserved.
//

import XCTest
import RxCocoa
import RxSwift
@testable import mvvm_tdd_github

class TestSearchUserUseCase: XCTestCase {
    
    var mockRepo: GithubRepository!
    var useCase: SearchUsersUseCase!
    var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        mockRepo = MockHTTPSession()
        useCase = DefaultSearchUsersUseCase(repo: mockRepo)
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        mockRepo = nil
        useCase = nil
        disposeBag = nil
    }
    
    func testSearchEmptyKeyword() {
    }
    
}
