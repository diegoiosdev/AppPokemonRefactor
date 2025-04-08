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
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier, for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        
        let pokemon =  pokemons[indexPath.row]
        cell.configure(with: pokemon)
        return cell
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
