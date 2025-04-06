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
