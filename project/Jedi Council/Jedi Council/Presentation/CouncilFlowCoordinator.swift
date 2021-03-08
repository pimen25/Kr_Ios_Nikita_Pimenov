//
//  CouncilFlowCoordinator.swift
//  Jedi Council
//
//  Created by Teacher on 08.03.2021.
//

import UIKit

class CouncilFlowCoordinator {
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    func startViewController() -> UIViewController {
        UINavigationController(rootViewController: storyboard.instantiateViewController(withIdentifier: "CouncilListViewController"))
    }
}
