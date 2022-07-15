//
//  ReportCollectionViewCell.swift
//  AppMinhasFinancas
//
//  Created by Admin on 16/06/22.
//

import UIKit

class ReportTableViewCell: UITableViewCell {
    
    public let identifier:String = "ReportTableViewCell"
    
    lazy var reportTableViewCellScreen:ReportTableViewCellScreen = {
        let view = ReportTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.reportTableViewCellScreen)
        self.backgroundColor = CustomColors().PowderBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createConstraintMenuView(){
        NSLayoutConstraint.activate([
            self.reportTableViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.reportTableViewCellScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.reportTableViewCellScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.reportTableViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
