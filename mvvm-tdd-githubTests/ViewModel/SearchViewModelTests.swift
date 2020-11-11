//
//  SearchViewModelTests.swift
//  mvvm-tdd-githubTests
//
//  Created by jsshin on 2020/11/11.
//  Copyright © 2020 jsshin. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
@testable import mvvm_tdd_github

class SearchViewModelTests: XCTestCase {
    
    var stubUseCase: StubSearchUsersUseCase!
    var vm: SearchViewModelType!

    override func setUpWithError() throws {
        stubUseCase = StubSearchUsersUseCase()
        vm = SearchViewModel(searchUseCase: stubUseCase)
    }

    override func tearDownWithError() throws {
        stubUseCase = nil
        vm = nil
    }

    func test_searchEmptyKeywordThenSearchButtonDisabled() {
        // given
        let keyword = ""
        
        // when
        vm.inputs.setKeyword(keyword: keyword)
        vm.inputs.search()
        
        // then
        XCTAssertEqual(stubUseCase.searchUsersCallsCount, 1)
        XCTAssertEqual(try! vm.outputs.enabledSearchButon.toBlocking().first(), false)
    }
    
    func test_searchAndThreeResults() {
        // given
        let keyword = "Test"
        stubUseCase.result.append(SearchUserModel(name: "", thumbnailUrl: ""))
        stubUseCase.result.append(SearchUserModel(name: "", thumbnailUrl: ""))
        stubUseCase.result.append(SearchUserModel(name: "", thumbnailUrl: ""))
        
        // when
        vm.inputs.setKeyword(keyword: keyword)
        vm.inputs.search()
        
        // then
        XCTAssertEqual(stubUseCase.searchUsersCallsCount, 1)
        XCTAssertEqual(try! vm.outputs.enabledSearchButon.toBlocking().first(), true)
        XCTAssertEqual(try! vm.outputs.searchResults.toBlocking().first()?.count, 3)
    }
}
