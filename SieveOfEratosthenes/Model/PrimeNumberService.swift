//
//  PrimeNumberService.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 15/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import Foundation

class PrimeNumberService {
    func calculatePrimeNumbers(_ inputNumber: Int, result: ([PrimeNumber]) -> Void) {
        var sievedNumbers = Array(0...inputNumber)
        var primeNumbers: [PrimeNumber] = []
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
        sievedNumbers.forEach { (number) in
            if number != 0 {
                primeNumbers.append(PrimeNumber(primeNumber: number))
            }
        }
        print(sievedNumbers)
        print(primeNumbers)
        result(primeNumbers)
    }
}
