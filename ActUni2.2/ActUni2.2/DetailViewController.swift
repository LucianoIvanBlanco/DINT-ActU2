//  ActUni2.2
//
//  Created by Luciano Blanco on 1/11/24.

import UIKit

class DetailViewController: UIViewController {
    
    var category: Category?
    
    var imageView: UIImageView!
    var descriptionLabel: UILabel!
    
    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    // Inicializador requerido para Storyboards/XIBs
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        setupCloseButton()
    }
    
    // Configura la UI de DetailViewController
    func setupUI() {
        guard let category = category else { return }
        
        // Configurar la imageView
        imageView = UIImageView(frame: CGRect.zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        if let image = UIImage(named: category.image) {
            imageView.image = image
        }
        view.addSubview(imageView)
        
        // Configurar la descriptionLabel
        descriptionLabel = UILabel(frame: CGRect.zero)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = category.description
        descriptionLabel.textAlignment = .center
        view.addSubview(descriptionLabel)
        
        // Añadir Constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // Configura un botón de cierre
    func setupCloseButton() {
        let closeButton = UIButton(type: .system)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Cerrar", for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        view.addSubview(closeButton)
        
        // Configurar las constraints para el botón de cierre
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }
    
    // Acción para el botón de cierre
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
