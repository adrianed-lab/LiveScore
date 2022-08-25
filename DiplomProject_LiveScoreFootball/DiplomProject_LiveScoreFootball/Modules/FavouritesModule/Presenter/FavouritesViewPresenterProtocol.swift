//
//  FavouritesViewPresenterProtocol.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 21.08.22.
//

import Foundation

protocol FavouritesViewPresenterProtocol: AnyObject {
    func getFavouritesTeam()
}

class FavouritesViewPresenter: FavouritesViewPresenterProtocol {
    
    weak var view: FavouritesViewProtocol!
    var router: FavouritesRouterProtocol?
    
    required init(view: FavouritesViewProtocol, router: FavouritesRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    
    func getFavouritesTeam() {
            //
        }
}
