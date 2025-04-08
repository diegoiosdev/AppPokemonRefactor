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
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    lazy var defenseTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGreen
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    lazy var notDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 1
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setupConstrains()
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemTeal.cgColor
        contentView.layer.masksToBounds = true
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
        self.contentView.addSubview(notDescription)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imagePokemon.image = nil
        imageViewProject.image = nil
        attackTitle.text = nil
        defenseTitle.text = nil
    }
    
    func configure(with pokemon: Pokemon) {
        attackTitle.text = "Attack: \(pokemon.attack)"
        defenseTitle.text = "Defense: \(pokemon.defense)"
        notDescription.text = "Description: \(pokemon.notDescription)"
        textLabelProject.text = pokemon.name.uppercased(with: .autoupdatingCurrent)
        imagePokemon.image = nil
        if let imageURL = URL(string: pokemon.imageUrl) {
            DispatchQueue.global(qos: .background).async {
                if let imageData = try? Data(contentsOf: imageURL),
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async { [weak self] in
                        self?.imagePokemon.image = image
                    }
                }
            }
        }
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            
            textLabelProject.centerXAnchor.constraint(equalTo: contentView.centerXAnchor,constant: 10),
            textLabelProject.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            
            imagePokemon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            imagePokemon.heightAnchor.constraint(equalToConstant: 120),
            
            imageViewProject.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 320),
            imageViewProject.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageViewProject.heightAnchor.constraint(equalToConstant: 30),
            imageViewProject.widthAnchor.constraint(equalToConstant: 30),
            
            defenseTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            defenseTitle.centerYAnchor.constraint(equalTo: textLabelProject.centerYAnchor, constant: 25),
            
            attackTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            attackTitle.centerYAnchor.constraint(equalTo: defenseTitle.centerYAnchor, constant: 25),
            
            notDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            notDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            notDescription.centerYAnchor.constraint(equalTo: attackTitle.centerYAnchor, constant: 100)
            
        ])
    }
}
