import UIKit

class PokemonTableViewCell: UITableViewCell {

    static let identifier:String = "PokemonTableViewCell"
    
    let imageViewProject:UIImageView = .imageViewProject(named: "star")
    let textLabelProject:UILabel = .textLabelProject(0)

    lazy var imagePokemon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var attackTitle: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var defenseTitle: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        configContraintsTableView()
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
        ])
    }
    
    func configContraintsTableView() {
        
//        self.imagePokemon.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview()
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview().inset(255)
//            make.height.equalTo(120)
//        }
//        
//        self.textLabelProject.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.leading.equalToSuperview()
//            
//            }
//        
//        self.imageViewProject.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(320)
//            make.trailing.equalToSuperview()
//            make.height.equalTo(30)
//            make.width.equalTo(30)
//        }
//        
//        self.defenseTitle.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(150)
//            make.centerY.equalToSuperview().offset(5)
//            make.bottom.equalTo(self.attackTitle.snp.bottom).offset(25)
//        }
//        
//        self.attackTitle.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(150)
//            make.centerY.equalToSuperview().offset(25)
//            make.trailing.equalToSuperview().inset(50)
//            make.bottom.equalToSuperview()
//        }
    }
}
