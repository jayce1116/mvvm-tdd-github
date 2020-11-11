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
import RxBlocking
@testable import mvvm_tdd_github

class TestSearchUserUseCase: XCTestCase {
    
    var stubRepo: StubHTTPSession!
    var useCase: SearchUsersUseCase!

    override func setUpWithError() throws {
        stubRepo = StubHTTPSession()
        useCase = DefaultSearchUsersUseCase(repo: stubRepo)
    }

    override func tearDownWithError() throws {
        stubRepo = nil
        useCase = nil
    }
    
    func testSearchEmptyKeyword() {
        // given
        let keyword = ""
        
        // when
        let result = try! useCase.searchUsers(keyword: keyword, sort: "", order: "")
            .toBlocking()
            .single()
        
        // then
        XCTAssertEqual(stubRepo.searchUsersCallCount, 1)
        XCTAssertEqual(result.count, 0)
    }
    
    func testSearchAndThreeResult() {
        // given
        let keyword = ""
        
        stubRepo.searchItem.append(SearchUserModel(name: "", thumbnailUrl: ""))
        stubRepo.searchItem.append(SearchUserModel(name: "", thumbnailUrl: ""))
        stubRepo.searchItem.append(SearchUserModel(name: "", thumbnailUrl: ""))
        
        // when
        let result = try! useCase.searchUsers(keyword: keyword, sort: "", order: "")
            .toBlocking()
            .single()
        
        // then
        XCTAssertEqual(stubRepo.searchUsersCallCount, 1)
        XCTAssertEqual(result.count, 3)
    }
    
}
