//
//  CouncilMember.swift
//  Jedi Council
//
//  Created by Teacher on 08.03.2021.
//

import Foundation

struct CouncilMember {
    enum Rank {
        case grandmaster
        case headOfCouncil
        case master
        case knight
    }
    let id: String
    let name: String
    let rank: Rank
    let imageUrl: URL?
}
