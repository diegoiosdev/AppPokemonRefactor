import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    static let identifier:String = "PokemonTableViewCell"
    
    let imageViewProject:UIImageView = .imageViewProject(named: "star")
    let textLabelProject:UILabel = .textLabelProject(0)
    
    lazy var imagePokemon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var attackTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var defenseTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGreen
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.contentView.addSubview(imagePokemon)
        self.contentView.addSubview(textLabelProject)
        self.contentView.addSubview(attackTitle)
        self.contentView.addSubview(defenseTitle)
        self.contentView.addSubview(imageViewProject)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            imagePokemon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imagePokemon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imagePokemon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePokemon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -225),
            imagePokemon.heightAnchor.constraint(equalToConstant: 120),
            
            textLabelProject.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textLabelProject.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            imageViewProject.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 320),
            imageViewProject.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageViewProject.heightAnchor.constraint(equalToConstant: 30),
            imageViewProject.widthAnchor.constraint(equalToConstant: 30),
            
            defenseTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            defenseTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 5),
            defenseTitle.bottomAnchor.constraint(equalTo: attackTitle.bottomAnchor, constant: -25),
            
            attackTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            attackTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            attackTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 25),
            attackTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
}
