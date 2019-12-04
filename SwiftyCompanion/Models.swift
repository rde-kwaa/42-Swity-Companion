//
//  Models.swift
//  SwiftyCompanion
//
//  Created by Ryan de Kwaadsteniet on 12/4/19.
//  Copyright © 2019 Ryan de Kwaadsteniet. All rights reserved.
//

import Foundation
import UIKit

struct Project: CustomStringConvertible {
    let name: String
    let score: Float
    let validated: Bool
    let status: String
    
    var scoreString: String {
        get {
            switch status {
            case "in_progress":
                return "in_progress"
            default:
                return "\(Int(score))"
            }
        }
    }
    
    var description: String {
        get {
            return "Project \(name): Score (\(score)) --> \(validated)"
        }
    }
}

struct Skill: CustomStringConvertible {
    let name: String
    let score: Float
    
    var description: String {
        get {
            return "Skill \(name) score \(score)"
        }
    }
}

struct Achievement {
    let name: String
    let description: String
    let imageUrl: URL
    var svgData: String?
}

struct UserProfile {
    let skills: [Skill]
    let projects: [Project]
    let achievements: [Achievement]
    let login: String
    let grade: String
    let wallet: Int
    let correctionPts: Int
    let position: String
    let level: Float
    let pictureUrl: URL
    var pictureData: Data?
    
    public func getGradeString() -> String {
        if grade == "" {
            return "None"
        }
        return grade
    }
    
    public func getPositionString() -> String {
        if position == "" {
            return "Unavailable"
        }
        return position
    }
    
    public func getWalletString() -> String {
        return "\(wallet)₳"
    }
    
    public func getLevelString() -> String{
        return "\(Int(level)) - \(Int(level.truncatingRemainder(dividingBy:1.0) * 100))%"
    }
}

struct User {
    let login: String
    let id: Int
}

struct AccessToken {
    let access_token: String
    let expire_date: Date
    
    var is_valid: Bool {
        get {
            if expire_date > Date() {
                return true
            }
            return false
        }
    }
}
