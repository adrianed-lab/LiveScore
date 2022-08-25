//
//  StandingViewPresenter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.08.22.
//

import Foundation

protocol StandingViewPresenterProtocol: AnyObject {
    func getStandingByLeagueId(leagueId: Int)
    func configureCell(indexPath: IndexPath, cell: StandingTableViewCellProtocol)
    func countStandings() -> Int
    var leagueTable: LeagueTable? {get}
}

class StandingViewPresenter: StandingViewPresenterProtocol {
    
    weak var view: StandingViewProtocol?
    var router: StandingRouterProtocol?
    var apiProvider: RestAPIProviderProtocol!
    private (set) var leagueTable: LeagueTable?
    var leagueId: Int

    required init(view: StandingViewProtocol, router: StandingRouterProtocol, apiProvider: RestAPIProviderProtocol, leagueId: Int) {
        self.view = view
        self.router = router
        self.apiProvider = apiProvider
        self.leagueId = leagueId
        getStandingByLeagueId(leagueId: leagueId)
    }
    
    func getStandingByLeagueId(leagueId: Int) {
        apiProvider.getLeagueTable(seasonYear: 2022, leagueId: leagueId) { [weak self] result in
            guard let self = self, let view = self.view else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.leagueTable = value
                    view.successGetStanding()
                case .failure(let error):
                    view.failure(error: error)
                }
            }
        }
    }

    func countStandings() -> Int {
        guard let countStandings = leagueTable?.response.first?.league.standings.first?.count else {return 0}
        return countStandings
    }
    
    func configureCell(indexPath: IndexPath, cell: StandingTableViewCellProtocol) {
        guard let standings = leagueTable?.response.first?.league.standings.first?[indexPath.row] else {return}
        let teamRank = standings.rank
        let teamLogo = standings.team.id
        let teamName = standings.team.name
        let playedGames = standings.all.played
        let goalsFor = standings.all.goals.goalsFor
        let goalsAgainst = standings.all.goals.against
        let points = standings.points
        cell.configureCell(rank: teamRank, teamLogo: teamLogo, teamName: teamName, games: playedGames, goalsFor: goalsFor, goalsAgainst: goalsAgainst, points: points)
    }
    
}