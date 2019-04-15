//
//  IViewController.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 15/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import Foundation

protocol IViewController: AnyObject {
    func setNumbersWith(primeNumbers: [PrimeNumber])
}
