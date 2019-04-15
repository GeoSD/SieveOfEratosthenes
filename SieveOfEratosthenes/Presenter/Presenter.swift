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
    
//    private func calculationOfPrimeNumbersWith(_ inputNumber: Int) {
//        sievedNumbers.removeAll()
//        for index in 0...inputNumber {
//            sievedNumbers.append(index)
//        }
//        sievedNumbers[0] = 0
//        sievedNumbers[1] = 0
//
//        var i = 2
//        while i <= inputNumber {
//            if sievedNumbers[i] != 0 {
//                var j = i + i
//                while j <= inputNumber {
//                    sievedNumbers[j] = 0
//                    j += i
//                }
//            }
//            i += 1
//        }
//        sievedNumbers.forEach { (num) in
//            if num != 0 {
//                primeNubers.append(PrimeNumber(primeNumber: num))
//            }
//        }
//        print(sievedNumbers)
//        print(primeNubers)
//    }
}

extension Presenter: IPresenter {
    func setIViewController(iViewController: IViewController?) {
        self.iViewController = iViewController
    }
    
    func calculatePrimeNumbers(from stringNumber: String) {
        guard let inputNumber = Int(stringNumber) else { return }
//        calculationOfPrimeNumbersWith(inputNumber)
        primeNumberService.calculatePrimeNumbers(inputNumber) { (primeNumbers) in
            iViewController?.setNumbersWith(primeNumbers: primeNumbers)
        }
        
    }
}
