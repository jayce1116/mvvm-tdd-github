//
//  SearchTableViewCell.swift
//  mvvm-tdd-github
//
//  Created by jsshin on 2020/11/12.
//  Copyright © 2020 jsshin. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var reuseIdentifier: String? {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
    }
    
    private func initUI() {
        self.addSubview(titleLable)
        
        titleLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        titleLable.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setItem(item: SearchUserModel) {
        
    }
}
