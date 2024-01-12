//  ActUni2.2
//
//  Created by Luciano Blanco on 1/11/24.

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTableHeaderView()
    }
    
    // Configura la tabla
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        // Ajustar contentInsets para agregar espacio entre las celdas
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        view.addSubview(tableView)
    }
    
    // Configura el encabezado de la tabla
    func setupTableHeaderView() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 60))
        headerView.backgroundColor = .clear
        
        let titleLabel = UILabel(frame: headerView.bounds)
        titleLabel.text = "Categorías"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        
        headerView.addSubview(titleLabel)
        tableView.tableHeaderView = headerView
    }
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Category.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let category = Category.sampleData[indexPath.row]
        
        // Configurar la imagen como backgroundView con espacio
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: cell.bounds.width - 20, height: cell.bounds.height - 20))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        if let image = UIImage(named: category.image) {
            imageView.image = image
        }
        cell.backgroundView = imageView
        
        // Configuración del texto
        cell.textLabel?.text = category.name
        cell.textLabel?.font = UIFont.systemFont(ofSize: 24)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        
        return cell
    }
    
    // Ajusta la altura de cada fila
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220 // Altura para cada celda, ajustada para dar espacio
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let category = Category.sampleData[indexPath.row]
        let detailVC = DetailViewController(category: category)
        
        // Presentar DetailViewController de manera modal
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true)
    }
}
