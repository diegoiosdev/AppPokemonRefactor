import UIKit
import SnapKit

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
        tableView.backgroundColor = .white
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.identifier)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
         addSubview(titleHome)
         addSubview(homeImageView)
         addSubview(tableView)
         configContraintsView()
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
    
   func configContraintsView() {
        
        self.homeImageView.snp.makeConstraints { make in
            make.top.equalTo(25)
            make.trailing.equalToSuperview().inset(50)
            make.height.equalTo(70)
            make.width.equalTo(70)
        }
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.homeImageView.snp.top).offset(65)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.titleHome.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(45)
            
        }
    }
}
