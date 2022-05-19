//
//  CharacterDetailsViewController.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 18/05/22.
//

import UIKit

class CharacterDetailsViewController: UIViewController, Storyboarded {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var speciesLabel: UILabel!
    @IBOutlet private weak var genderLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!

    @IBOutlet private weak var nameView: UIView!
    @IBOutlet private weak var statusView: UIView!
    @IBOutlet private weak var speciesView: UIView!
    @IBOutlet private weak var genderView: UIView!
    @IBOutlet private weak var locationView: UIView!

    weak var coordinator: MainCoordinator?
    static let storyboardId: String = String(describing: CharacterDetailsViewController.self)
    var charactersDetailViewModel : CharactersDetailViewModellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }

    private func loadUI() {
        imageView.load(url:URL(string:charactersDetailViewModel?.getImage() ?? "")!)
        navigationItem.title = charactersDetailViewModel?.getName()
        nameLabel.text = charactersDetailViewModel?.getName()
        statusLabel.text = charactersDetailViewModel?.getStatus()
        genderLabel.text = charactersDetailViewModel?.getGender()
        speciesLabel.text = charactersDetailViewModel?.getSpecies()
        locationLabel.text = charactersDetailViewModel?.getLocation()
    }
    
    private func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        imageView.load(url: url)
    }
    
}
