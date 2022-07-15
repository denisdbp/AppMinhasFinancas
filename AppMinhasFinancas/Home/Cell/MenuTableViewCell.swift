//
//  MenuCollectionViewCell.swift
//  AppMinhasFinancas
//
//  Created by Admin on 12/06/22.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    public let identifier:String = "MenuTableViewCell"
    
    lazy var menuView:MenuTableViewCellScreen = {
        let view = MenuTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.menuView)
        self.createConstraintMenuView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createConstraintMenuView(){
        NSLayoutConstraint.activate([
            self.menuView.topAnchor.constraint(equalTo: self.topAnchor),
            self.menuView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.menuView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.menuView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
