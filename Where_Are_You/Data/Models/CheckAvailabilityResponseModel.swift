//
//  CheckAvailabilityResponseModel.swift
//  Where_Are_You
//
//  Created by 오정석 on 23/6/2024.
//

import Foundation

struct CheckAvailabilityResponseModel: Decodable {
    let status: Int
    let message: String
    let data: CheckAvailabilityData
}

struct CheckAvailabilityData: Decodable {
    let userID: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case email = "email"
    }
}
