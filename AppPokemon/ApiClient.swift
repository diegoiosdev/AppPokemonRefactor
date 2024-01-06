import UIKit

protocol pokemonManagerDelegate{
    func mostrarListaPokemon(lista: [Pokemon])
}

struct PokemonManager {
    var delegate: pokemonManagerDelegate?
    
    func getPokemon(){
        let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("\(String(describing: error))")
                }
                
                if let dadosSeguros = data?.analisarDados(quitarString: "null,") {
                    if let listaPokemon = self.analisarJSON(dadosPokemon: dadosSeguros){
                        print("lista pokemon: ", listaPokemon)
                        delegate?.mostrarListaPokemon(lista: listaPokemon)
                    }
                }
            }
            task.resume()
        }
    }
    
    func analisarJSON(dadosPokemon: Data) -> [Pokemon]? {
        let decodificador = JSONDecoder()
        do {
            let dadosDecodificados =  try decodificador.decode([Pokemon].self, from: dadosPokemon)
            return dadosDecodificados
            
        } catch{
            print("Error ao decodificar os dados:", error.localizedDescription)
            return nil
        }
    }
}

extension Data {
    func analisarDados(quitarString palavra: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: palavra, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
