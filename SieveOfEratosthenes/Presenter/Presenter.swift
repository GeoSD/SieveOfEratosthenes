//
//  Presenter.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 14/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import UIKit

class Presenter {
    private var inputNumber: UInt = 0
    
    private func calculationOfPrimeNumbers() {
        
    }
}

extension Presenter: IPresenter {
    func primeNumberFor(index: Int) -> UInt {
        return UInt.max
//        return 1
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func checkInputed(numberFrom stringNumber: String) {
        guard let inputNumber = UInt(stringNumber) else { return }
        self.inputNumber = inputNumber
    }
    
    func sizeForItemAt(_ indexPath: IndexPath) -> CGSize {
        let someStringSize = String(UInt.max).size(withAttributes: nil)
//        let someStringSize = "1".size(withAttributes: nil)
        let calculatedWidth = someStringSize.width + 60
        let calculatedHeight = someStringSize.height + 20
        let sizeForItem = CGSize(width: calculatedWidth, height: calculatedHeight)
        return sizeForItem
    }
}
