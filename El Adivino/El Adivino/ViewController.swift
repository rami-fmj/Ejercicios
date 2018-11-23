//
//  ViewController.swift
//  El Adivino
//
//  Created by Ramiro Mosquera on 11/22/18.
//  Copyright © 2018 Ramiro Mosquera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblRespuesta: UILabel!
    let respuestas = ["Si","No","A veces","Con frecuencia", "Si te parece bien", "No creo que sea una buena idea", "Es fantástico", "Mejor pégate un tiro","No tengo idea","Me repites la pregunta?"]
    //Se requiere un valor sin signo y entero, superior al número de items
    var ultimoItem:UInt32 = 200
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnPreguntar(_ sender: Any) {
        ResponderPregunta()
    }
    
    func ResponderPregunta() {
        let items = UInt32(respuestas.count)
        var itemSeleccionado:UInt32 = 0
        //Seleccionar una respuesta distinta a la actual
        repeat {
            itemSeleccionado = arc4random_uniform(items)
        } while (ultimoItem==itemSeleccionado)
        ultimoItem=itemSeleccionado
        
        lblRespuesta.text = respuestas[Int(itemSeleccionado)]
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.imgLogo.transform = CGAffineTransform(scaleX: 0.5, y: 0.5).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi)).concatenating(CGAffineTransform(translationX: 0, y: 40))
                        
        }) { (completed) in
            self.imgLogo.transform = CGAffineTransform.identity
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            ResponderPregunta()
        }
    }
    

}

