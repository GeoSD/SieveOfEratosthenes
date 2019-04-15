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
    
    init(primeNumberService: PrimeNumberService) {
        self.primeNumberService = primeNumberService
    }
}

extension Presenter: IPresenter {
    func ifOkWith(_ userInput: String) -> Bool {
        guard let checkedNumber = Int(userInput) else {
            return false
        }
        guard checkedNumber > 1 else {
            return false
        }
        return true
    }
    
    func setIViewController(iViewController: IViewController?) {
        self.iViewController = iViewController
    }
    
    func calculatePrimeNumbers(from stringNumber: String) {
        guard let inputNumber = Int(stringNumber) else { return }
        primeNumberService.calculatePrimeNumbers(inputNumber) { (primeNumbers) in
            iViewController?.setNumbersWith(primeNumbers: primeNumbers)
        }
    }
}
