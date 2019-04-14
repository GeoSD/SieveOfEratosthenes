//
//  ViewController.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 14/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var calculationButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let iPresenter: IPresenter = Presenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func calculationButtonTapped(_ sender: UIButton) {
        let userInput = inputTextField.text ?? ""
        iPresenter.checkInputed(numberFrom: userInput)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iPresenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PrimeCell", for: indexPath)
        
        return cell
    }
}

extension ViewController: UITextFieldDelegate {
    
}
