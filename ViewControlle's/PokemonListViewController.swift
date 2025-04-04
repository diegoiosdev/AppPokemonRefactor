import UIKit

class PokemonListViewController: UIViewController {
    
    override func loadView() {
        self.homePokemonView = HomePokemonView()
        self.view = self.homePokemonView
    }
    
    var homePokemonView: HomePokemonView?
    var pokemonManager = PokemonManager()
    var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        homePokemonView?.configTableViewProtocol(delegate: self, dataSouse: self)
        pokemonManager.delegate = self
        pokemonManager.getPokemon()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonTableViewCell? = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier, for: indexPath) as? PokemonTableViewCell
        cell?.textLabelProject.text = pokemons[indexPath.row].name
        cell?.attackTitle.text = "Ataque: \(pokemons[indexPath.row].attack)"
        cell?.defenseTitle.text = "Defesa: \(pokemons[indexPath.row].defense)"
        if let urlString = pokemons[indexPath.row].imageUrl as? String {
            if let imageURL = URL(string: urlString){
                DispatchQueue.global().async {
                    guard let imageData = try? Data( contentsOf: imageURL) else { return}
                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        cell?.imagePokemon.image = image
                    }
                }
            }
        }
        return cell ?? UITableViewCell()
    }
}

extension PokemonListViewController: pokemonManagerDelegate {
    func mostrarListaPokemon(lista: [Pokemon]) {
        pokemons = lista
        DispatchQueue.main.async {
            self.homePokemonView?.tableView.reloadData()
        }
    }
}
