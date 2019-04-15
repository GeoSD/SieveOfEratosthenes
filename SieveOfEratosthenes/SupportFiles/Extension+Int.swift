//
//  Extension+Int.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 15/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import Foundation

extension Int {
    func sqr() -> Int {
        return self * self
    }
    func asPrimeNumber() -> PrimeNumber {
        return PrimeNumber(primeNumber: self)
    }
}
