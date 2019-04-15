//
//  Presenter.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 14/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import UIKit

class Presenter {
    private var inputNumber: Int = 0
    private var sievedNumbers: [Int] = []
    private var primeNubers: [Int] = []
    
    private func calculationOfPrimeNumbers() {
        sievedNumbers.removeAll()
        sievedNumbers = Array(repeating: 1, count: inputNumber)
        for i in 2...(2 * inputNumber + 1) {
            if sievedNumbers[i] == 1 {
                
            }
        }
    }
}

extension Presenter: IPresenter {
    func primeNumberFor(index: Int) -> Int {
        return Int.max
//        return 1
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func checkInputed(numberFrom stringNumber: String) {
        guard let inputNumber = Int(stringNumber) else { return }
        self.inputNumber = inputNumber
    }
    
    func sizeForItemAt(_ indexPath: IndexPath) -> CGSize {
        let someStringSize = String(Int.max).size(withAttributes: nil)
//        let someStringSize = "1".size(withAttributes: nil)
        let calculatedWidth = someStringSize.width + 60
        let calculatedHeight = someStringSize.height + 20
        let sizeForItem = CGSize(width: calculatedWidth, height: calculatedHeight)
        return sizeForItem
    }
}
