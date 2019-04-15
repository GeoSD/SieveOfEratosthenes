//
//  Presenter.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 14/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import UIKit

class Presenter {
    weak var iViewController: IViewController?
    
    private var inputNumber: Int = 0
    private var sievedNumbers: [Int] = []
    private var primeNubers: [Int] = []
    
    private func calculationOfPrimeNumbers() {
        sievedNumbers.removeAll()
        for index in 0...inputNumber {
            sievedNumbers.append(index)
        }
        sievedNumbers[0] = 0
        sievedNumbers[1] = 0
        
        var i = 2
        while i <= inputNumber {
            if sievedNumbers[i] != 0 {
                var j = i + i
                while j <= inputNumber {
                    sievedNumbers[j] = 0
                    j += i
                }
            }
            i += 1
        }
        primeNubers = sievedNumbers.filter { $0 != 0 }
        print(sievedNumbers)
        print(primeNubers)
        iViewController?.reloadCollectionView()
    }
}

extension Presenter: IPresenter {
    func setIViewController(iViewController: IViewController?) {
        self.iViewController = iViewController
    }
    
    func primeNumberFor(index: Int) -> Int {
        return primeNubers[index]
    }
    
    func numberOfItems() -> Int {
        return primeNubers.count
    }
    
    func calculatePrimeNumbers(from stringNumber: String) {
        guard let inputNumber = Int(stringNumber) else { return }
        self.inputNumber = inputNumber
        calculationOfPrimeNumbers()
    }
    
    func sizeForItemAt(_ indexPath: IndexPath) -> CGSize {
        let index = indexPath.row
        let someStringSize = String(primeNubers[index]).size(withAttributes: nil)
        let calculatedWidth = someStringSize.width
        let calculatedHeight = someStringSize.height + 20
        let sizeForItem = CGSize(width: calculatedWidth, height: calculatedHeight)
        return sizeForItem
    }
}
