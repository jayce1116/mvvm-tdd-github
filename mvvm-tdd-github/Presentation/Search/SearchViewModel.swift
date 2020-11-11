//
//  SearchViewModel.swift
//  mvvm-tdd-github
//
//  Created by jsshin on 2020/11/11.
//  Copyright © 2020 jsshin. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol SearchViewModelInputs {
    func setKeyword(keyword: String)
    func search()
}

protocol SearchViewModelOutputs {
    var enabledSearchButon: Driver<Bool> { get }
    var searchResults: Driver<[SearchUserModel]> { get }
}

protocol SearchViewModelType {
    var inputs: SearchViewModelInputs { get }
    var outputs: SearchViewModelOutputs { get }
}

class SearchViewModel: SearchViewModelType, SearchViewModelInputs, SearchViewModelOutputs {
    
    private let disposeBag = DisposeBag()
    
    private let searchUseCase: SearchUsersUseCase
    
    init(searchUseCase: SearchUsersUseCase) {
        self.searchUseCase = searchUseCase
    }
    
    var inputs: SearchViewModelInputs { return self }
    
    private var keyword: String = ""
    
    func setKeyword(keyword: String) {
        self.keyword = keyword
        _enabledSearchButton.accept(!self.keyword.isEmpty)
    }
    
    func search() {
        self.searchUseCase.searchUsers(keyword: keyword, sort: "", order: "")
            .bind(to: _searchResults)
            .disposed(by: disposeBag)
    }
    
    var outputs: SearchViewModelOutputs { return self }
    
    private let _searchResults = BehaviorRelay<[SearchUserModel]>.init(value: [])
    
    var searchResults: Driver<[SearchUserModel]> { return _searchResults.asDriver(onErrorJustReturn: []) }
    
    private let _enabledSearchButton = BehaviorRelay<Bool>.init(value: false)
    var enabledSearchButon: Driver<Bool> { return _enabledSearchButton.asDriver(onErrorJustReturn: false) }
    
}
