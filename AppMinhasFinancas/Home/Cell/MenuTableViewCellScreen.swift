//
//  MenuCollectionViewCellScreen.swift
//  AppMinhasFinancas
//
//  Created by Admin on 12/06/22.
//

import UIKit

class MenuTableViewCellScreen: UIView {
    
    lazy var menuLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "Arial", size: 15)
        return label
    }()
    
    lazy var menuImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createSubViews()
        self.createConstraintMenuImage()
        self.createConstraintMenuLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSubViews(){
        self.addSubview(self.menuLabel)
        self.addSubview(self.menuImage)
    }
    
    private func createConstraintMenuLabel(){
        NSLayoutConstraint.activate([
            self.menuLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.menuLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func createConstraintMenuImage(){
        NSLayoutConstraint.activate([
            self.menuImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.menuImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.menuImage.widthAnchor.constraint(equalToConstant: 50),
            self.menuImage.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
