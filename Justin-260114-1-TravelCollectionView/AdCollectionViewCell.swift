//
//  AdCollectionViewCell.swift
//  Justin-260114-1-TravelCollectionView
//
//  Created by 서정민 on 1/15/26.
//

import UIKit

class AdCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AdCollectionViewCell"
    
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var adContentLabel: UILabel!
    @IBOutlet var adButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        setAdLabel()
        setAdContentLabel()
        setAdButton()
    }
    
    func setAdLabel() {
        adLabel.backgroundColor = .orange
        adLabel.text = " AD    "
        adLabel.textColor = .white
        adLabel.textAlignment = .center
        adLabel.font = .systemFont(ofSize: 13, weight: .heavy)
        adLabel.layer.cornerRadius = 10
        adLabel.clipsToBounds = true
        adLabel.layer.borderColor = UIColor.clear.cgColor
    }
    
    func setAdContentLabel() {
        adContentLabel.backgroundColor = .clear
        adContentLabel.text = "adContent"
        adContentLabel.textColor = .black
        adContentLabel.textAlignment = .center
        adContentLabel.font = .boldSystemFont(ofSize: 13)
        adContentLabel.layer.borderColor = UIColor.clear.cgColor
        adContentLabel.numberOfLines = 0
    }
    
    func setAdButton() {
        adButton.setTitle("", for: .normal)
        adButton.backgroundColor = .opaqueYellow
        adButton.layer.cornerRadius = 10
        adButton.clipsToBounds = true
        adButton.layer.borderColor = UIColor.yellow.cgColor
        adButton.layer.borderWidth = 1
    }

}
