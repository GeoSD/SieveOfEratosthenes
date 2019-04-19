//
//  Presenter.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 14/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import UIKit

class Presenter {
    
    private weak var iViewController: IViewController?
    private let primeNumberService: PrimeNumberService
    private var sievedNumbers: [Int] = []
    
    private var primeNumbers: [PrimeNumber] = []
    
    init(primeNumberService: PrimeNumberService) {
        self.primeNumberService = primeNumberService
    }
}

extension Presenter: IPresenter {
    func okWith(_ userInput: String) -> Bool {
        guard let checkedNumber = Int(userInput) else {
            return false
        }
        guard checkedNumber > 1 else {
            return false
        }
        return true
    }
    
    func set(view: IViewController?) {
        self.iViewController = view
    }
    
    func calculatePrimeNumbers(from stringNumber: String) {
        guard let inputNumber = Int(stringNumber) else { return }
        primeNumberService.calculatePrimeNumbers(inputNumber) { [weak self] (primeNumbers) in
            self?.primeNumbers = primeNumbers
            self?.iViewController?.reloadView()
        }
    }
    
    func numberOfItems() -> Int {
        return primeNumbers.count
    }
    
    func item(for indexPath: IndexPath) -> PrimeNumber {
        return primeNumbers[indexPath.row]
    }
}
