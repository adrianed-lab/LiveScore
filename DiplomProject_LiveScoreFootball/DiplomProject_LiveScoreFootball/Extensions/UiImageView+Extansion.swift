//
//  UiImageView+Extansion.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 20.08.22.
//

import Foundation
import UIKit
import SVGKit


extension UIImageView {
    func getLeagueLogo(leagueId: Int) {
        guard let imageUrl = URL(string: "\(Constants.baseURLForLeagueLogo)\(leagueId)\(Constants.teamlogoPrefixURL)") else {return}
        DispatchQueue.global(qos: .utility).async {
            if let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
    func getLogoTeam(teamId: Int) {
        guard let imageUrl = URL(string: "\(Constants.baseURLForTeamLogo)\(teamId)\(Constants.teamlogoPrefixURL)") else {return}
        DispatchQueue.global(qos: .utility).async {
            if let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    func getPlayerPhoto(playerId: Int) {
        guard let imageUrl = URL(string: "\(Constants.baseURLForPlayerPhoto)\(playerId)\(Constants.teamlogoPrefixURL)") else {return}
        DispatchQueue.global(qos: .utility).async {
            if let imageData = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    func getCountryFlag(codeCountry: String) {
        guard let svgPhoto = URL(string: codeCountry) else {return}
        DispatchQueue.global(qos: .utility).async {
            if let data = try? Data(contentsOf: svgPhoto) {
                let receivedimage: SVGKImage = SVGKImage(data: data)
                let image = receivedimage.uiImage
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}

