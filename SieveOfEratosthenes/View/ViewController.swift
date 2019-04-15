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
    
    private var iPresenter: IPresenter = Presenter(primeNumberService: PrimeNumberService())
    private var primeNumbers: [PrimeNumber] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        configureCollectionView()
        iPresenter.setIViewController(iViewController: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: String(describing: PrimeNumberCell.self), bundle: nil), forCellWithReuseIdentifier: "PrimeCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextField.resignFirstResponder()
        return true
    }
    
    @IBAction private func calculationButtonTapped(_ sender: UIButton) {
        let userInput = inputTextField.text ?? ""
        if iPresenter.ifOkWith(userInput) {
            iPresenter.calculatePrimeNumbers(from: userInput)
        } else {
            showAlert()
            return
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return primeNumbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PrimeCell", for: indexPath) as! PrimeNumberCell
        let index = indexPath.row
        cell.configureCell(with: primeNumbers[index])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let index = indexPath.row
        let stringNumber = "\(primeNumbers[index])"
        let someStringSize = stringNumber.size(withAttributes: nil)
        let calculatedWidth = someStringSize.width + 20
        let calculatedHeight = someStringSize.height + 20
        let sizeForItem = CGSize(width: calculatedWidth, height: calculatedHeight)
        
        return sizeForItem
    }
}

extension ViewController: UITextFieldDelegate { }

extension ViewController: IViewController {
    func setNumbersWith(primeNumbers: [PrimeNumber]) {
        self.primeNumbers = primeNumbers
        collectionView.reloadData()
    }
}

extension ViewController {
    func showAlert() {
        let alert = UIAlertController(title: "", message: "Вы ввели неподходящее число! Введите число больше 1..", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.primeNumbers = []
            self.inputTextField.text = ""
            self.collectionView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
