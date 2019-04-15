//
//  PrimeNumberCell.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 14/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import UIKit

class PrimeNumberCell: UICollectionViewCell {
    @IBOutlet private weak var primeNumberLabel: UILabel!

    override func awakeFromNib() {
        configureCellUI()
    }

    private func configureCellUI() {
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    func configureCell(with primeNumber: PrimeNumber) {
        primeNumberLabel.text = "\(primeNumber)"
    }
}
