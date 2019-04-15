//
//  ViewController.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 14/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var calculationButton: UIButton!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var iPresenter: IPresenter = Presenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        iPresenter.setIViewController(iViewController: self)
    }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: String(describing: PrimeNumberCell.self), bundle: nil),
                                forCellWithReuseIdentifier: "PrimeCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @IBAction private func calculationButtonTapped(_ sender: UIButton) {
        let userInput = inputTextField.text ?? ""
        iPresenter.calculatePrimeNumbers(from: userInput)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iPresenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PrimeCell", for: indexPath) as! PrimeNumberCell
        cell.configureCell(with: indexPath)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFlowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        collectionViewFlowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        return iPresenter.sizeForItemAt(indexPath)
    }
}

extension ViewController: UITextFieldDelegate {
    
}

extension ViewController: IViewController {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}
