//
//  reportCollectionViewCell.swift
//  AppMinhasFinancas
//
//  Created by Admin on 16/06/22.
//

import UIKit

class ReportTableViewCellScreen: UIView {
    
    lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        label.font = UIFont(name: "Arial", size: 20)
        return label
    }()
    
    lazy var priceLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        label.font = UIFont(name: "Arial", size: 20)
        return label
    }()
    
    lazy var descriptionImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createSubViews()
        self.createConstraintDescriptionLabel()
        self.createConstraintPriceLabel()
        self.createConstraintDescriptionImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSubViews(){
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.priceLabel)
        self.addSubview(self.descriptionImage)
    }
    
    private func createConstraintDescriptionLabel(){
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
    }
    
    private func createConstraintPriceLabel(){
        NSLayoutConstraint.activate([
            self.priceLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 5),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
    
    private func createConstraintDescriptionImage(){
        NSLayoutConstraint.activate([
            self.descriptionImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.descriptionImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.descriptionImage.widthAnchor.constraint(equalToConstant: 40),
            self.descriptionImage.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
