//
//  ViewController.swift
//  IMC
//
//  Created by Francisco on 14/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfWeigth: UITextField!
    @IBOutlet weak var tfHeigth: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //função que ao clicar em qualquer parte da tela, abaixa o teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func calculate(_ sender: Any) {
        if let weigth =  Double(tfWeigth.text!), let heigth =  Double(tfHeigth.text!) {
            imc = weigth/(heigth*heigth)
            showResults()
        }
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        lbResult.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
    }
}

