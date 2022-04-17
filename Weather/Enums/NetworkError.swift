//
//  NetworkError.swift
//  Weather
//
//  Created by balaTTV on 16.04.2022.
//

import Foundation

enum NetworkError: Error {
    case badResponse
    case noData
    case noNetwork
}
