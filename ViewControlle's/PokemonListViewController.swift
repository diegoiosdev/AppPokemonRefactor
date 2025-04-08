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
        
//        let pokemon = pokemons[indexPath.row]
//        
//        // Configura textos da célula
//        cell.attackTitle.text = "Attack: \(pokemon.attack)"
//        cell.defenseTitle.text = "Defense: \(pokemon.defense)"
//        cell.notDescription.text = "Description: \(pokemon.notDescription)"
//        cell.textLabelProject.text = pokemon.name.uppercased(with: .autoupdatingCurrent)
//        cell.imagePokemon.image = nil // Placeholder ou nil antes de carregar nova imagem
//        
//        // Carrega imagem de forma assíncrona
//        if let imageURL = URL(string: pokemon.imageUrl) {
//            DispatchQueue.global(qos: .background).async {
//                if let imageData = try? Data(contentsOf: imageURL),
//                   let image = UIImage(data: imageData) {
//                    DispatchQueue.main.async {
//                        // Verifica se a célula ainda está visível para o indexPath
//                        if tableView.indexPath(for: cell) == indexPath {
//                            cell.imagePokemon.image = image
//                        }
//                    }
//                }
//            }
//        }
//        
//        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: PokemonTableViewCell? = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier, for: indexPath) as? PokemonTableViewCell
//        if let urlString = pokemons[indexPath.row].imageUrl as? String {
//            if let imageURL = URL(string: urlString){
//                DispatchQueue.global().async {
//                    guard let imageData = try? Data( contentsOf: imageURL) else { return}
//                    let image = UIImage(data: imageData)
//                    DispatchQueue.main.async { [self] in
//                        cell?.attackTitle.text = "Attack: \(pokemons[indexPath.row].attack)"
//                        cell?.defenseTitle.text = "Defense: \(pokemons[indexPath.row].defense)"
//                        cell?.notDescription.text = "Description: \(pokemons[indexPath.row].notDescription)"
//                        cell?.textLabelProject.text = self.pokemons[indexPath.row].name.uppercased(with: .autoupdatingCurrent)
//                        cell?.imagePokemon.image = image
//                    }
//                }
//            }
//        }
//        return cell ?? UITableViewCell()
//    }
}

extension PokemonListViewController: pokemonManagerDelegate {
    func mostrarListaPokemon(lista: [Pokemon]) {
        pokemons = lista
        DispatchQueue.main.async {
            self.homePokemonView?.tableView.reloadData()
        }
    }
}
