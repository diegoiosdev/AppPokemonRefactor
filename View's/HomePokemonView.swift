import UIKit

protocol HomePokemonViewProtocol: AnyObject {
    func actionBagasButton()
    func actionfavoretsButton()
}

class HomePokemonView: UIView {
    
    var delegate: HomePokemonViewProtocol?
    func delegate(delegate: HomePokemonViewProtocol?) {
        self.delegate = delegate
    }
    
    lazy var titleHome: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.text = "Pokemon"
        return label
    }()
    
    lazy var homeImageView: UIImageView = {
        let image  = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Charmander")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleHome)
        addSubview(homeImageView)
        addSubview(tableView)
        setupConstrains()
    }
    
    public func configTableViewProtocol(delegate:UITableViewDelegate, dataSouse: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSouse
    }
    
    func addSubview(){
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            
            homeImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            homeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            homeImageView.heightAnchor.constraint(equalToConstant: 70),
            homeImageView.widthAnchor.constraint(equalToConstant: 70),
            
            tableView.topAnchor.constraint(equalTo: homeImageView.bottomAnchor, constant: 65),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            titleHome.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            titleHome.topAnchor.constraint(equalTo: self.topAnchor, constant: 45)
            
        ])
    }
}
