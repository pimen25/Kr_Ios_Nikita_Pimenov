//
//  CouncilListViewController.swift
//  Jedi Council
//
//  Created by Teacher on 08.03.2021.
//

import UIKit

class CouncilListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let cellId: String = "Cell"
    @IBOutlet private var collectionView: UICollectionView!

    #warning("Temp implementation")

    override func viewDidLoad() {
        super.viewDidLoad()

        service.loadMembers { [self] result in
            switch result {
                case .success(let members):
                    self.members = members
                    collectionView.reloadData()
                case .failure(let error):
                    print(error)
            }
        }
    }

    private let service: CouncilService = MockCouncilService()
    private var members: [CouncilMember] = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        members.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CouncilMemberCell else {
            fatalError("Could not dequeue cell")
        }

        cell.set(member: members[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        service.loadMemberDetails(id: members[indexPath.item].id) { [self] result in
            switch result {
                case .success(let memberDetails):
                    let viewController: CouncilMemberViewController = storyboard!.instantiateViewController(identifier:  "CouncilMemberViewController")
                    navigationController?.pushViewController(viewController, animated: true)
                    viewController.set(member: memberDetails)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
