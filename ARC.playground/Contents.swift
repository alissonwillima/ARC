import UIKit

class DesenvolvimentoIOS {
    let title: String
    //Deixa a variavel fraca mas ela sempre vai existir por isso nao precisa usar o optional? !
    unowned let desenvolvedor: Desenvolvedor
    //Deixa a variavel fraca, mas precisa usar um optional?  porque ela pode nao existir!!
    // se nao existir nada ele adiciona nil
    weak var chef: Chef?
    
    init(title: String, desenvolvedor: Desenvolvedor) {
        self.title = title
        self.desenvolvedor = desenvolvedor
    }
    
    lazy var description: () -> String = { [unowned self] in
        "\(self.title) by \(self.desenvolvedor.name)"
    }
    
    deinit {
        print("Goodbye Application \(title)")
    }
}

class Chef {
    let name: String
    var desenvolvimentoios: [DesenvolvimentoIOS] = []
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Goodbye Application \(name)!")
    }
}

class Desenvolvedor {
    
    let name: String
    var desenvolvimentoios: [DesenvolvimentoIOS] = []
    
    init(name: String) {
        self.name = name
    }
    
    deinit{
        print("Goodbye Application Developer \(name)")
    }
}

do{
    let desenvolvedor = Desenvolvedor(name: "Alisson William")
    let desenvolvimentoios = DesenvolvimentoIOS(title: "IOS Course!!! Your Memory Management Test", desenvolvedor: desenvolvedor)
    print(desenvolvimentoios.description())
    let chef = Chef(name: "William")
    desenvolvimentoios.chef = chef
    chef.desenvolvimentoios.append(desenvolvimentoios)
}
