//
//  ViewController.swift
//  Naming
//
//  Created by Noura AlGhurair on 2/13/17.
//  Copyright © 2017 SpeechTherapy. All rights reserved.
//

import UIKit
var myLanguage : String = ""

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var KWlanguagepressed: UIButton!
    @IBOutlet weak var EGlanguagepressed: UIButton!
    @IBOutlet weak var UAElanguagepressed: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // EGlanguagepressed.isEnabled = false
        
        creatAlert(title: "إختيار اللهجة", message: "أي لهجة تريد العمل بها")
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "rlhome.png")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "rlhome.png")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        }
    
    override func viewDidAppear(_ animated: Bool) {
      
        }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any!) -> Bool {
        print("*** YEP, segue will occur")
        return true
    
    }
    
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? detailsview{
            destination.mycategory = segue.identifier!
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       func creatAlert(title: String, message: String)
        
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    
        
        alert.addAction(UIAlertAction(title: "كويتية", style:UIAlertAction.Style.default, handler:{ action in
            
            myLanguage = "KW_"
            self.KWlanguagepressed.layer.borderWidth = 8
            self.EGlanguagepressed.layer.borderWidth = 0
            self.UAElanguagepressed.layer.borderWidth = 0
            
        }))
        alert.addAction(UIAlertAction(title: "مصرية", style:UIAlertAction.Style.cancel, handler:{ action in
            
            myLanguage = "EG_"
            self.EGlanguagepressed.layer.borderWidth = 8
            self.KWlanguagepressed.layer.borderWidth = 0
            self.UAElanguagepressed.layer.borderWidth = 0
        }))
        
        
      alert.addAction(UIAlertAction(title: "اماراتية", style:UIAlertAction.Style.destructive, handler:{ action in
            
            myLanguage = "UAE_"
            self.UAElanguagepressed.layer.borderWidth = 8
            self.KWlanguagepressed.layer.borderWidth = 0
            self.EGlanguagepressed.layer.borderWidth = 0
        }))
        // show alert

   self.present(alert, animated: true, completion: nil)
        
     }
    
    @IBAction func EGlanguagepressed(_ sender: AnyObject) {
        myLanguage = "EG_"
        EGlanguagepressed.layer.borderWidth = 8
        KWlanguagepressed.layer.borderWidth = 0  // hide the layer's border if we're choose
        UAElanguagepressed.layer.borderWidth = 0
    }
    
    @IBAction func KWlanguagepressed(_ sender: Any) {
        myLanguage = "KW_"
        KWlanguagepressed.layer.borderWidth = 8
        EGlanguagepressed.layer.borderWidth = 0 
        UAElanguagepressed.layer.borderWidth = 0
        
   }
    
    
    @IBAction func UAElanguagepressed(_ sender: Any) {
        myLanguage = "UAE_"
        KWlanguagepressed.layer.borderWidth = 0
        EGlanguagepressed.layer.borderWidth = 0
        UAElanguagepressed.layer.borderWidth = 8
    }
    
}







