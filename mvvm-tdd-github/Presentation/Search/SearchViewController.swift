//
//  SearchViewController.swift
//  mvvm-tdd-github
//
//  Created by jsshin on 2020/11/10.
//  Copyright © 2020 jsshin. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchResultsUpdater = self
        controller.searchBar.delegate = self
        controller.delegate = self
        controller.searchBar.placeholder = "Search Books"
        controller.searchBar.keyboardType = .alphabet
        return controller
    }()
    
    var viewModel: SearchViewModelType? {
        didSet {
            fillUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel(searchUseCase: DefaultSearchUsersUseCase(repo: HTTPSession.shared))
        initUI()
    }
    
    func initUI() {
        tableView.tableHeaderView = searchController.searchBar
        tableView.delegate = self
    }
    
    private func fillUI() {
        viewModel?.outputs.searchResults
            .drive(tableView.rx.items(cellIdentifier: String(describing: SearchTableViewCell.self))) { (index: Int, item: SearchUserModel, cell: SearchTableViewCell) in
                cell.setItem(item: item)
        }.disposed(by: disposeBag)
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
    }
    
}
