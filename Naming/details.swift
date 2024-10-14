//
//  details.swift
//  Naming
//
//  Created by Noura AlGhurair on 2/13/17.
//  Copyright © 2017 SpeechTherapy. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class detailsview: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var myimage: UIImageView!
    var mycategory : String = "" 
    @IBOutlet weak var imgshow: UIButton!
    var audioPlayer : AVAudioPlayer?
    var mycurrentelement : Int = 0
    var mylabelsarray : [String] = []
     var animalsArr : [String] = ["خروف","بقرة","حمار","حصان","قط","جمل","ديك","حمامة","ربيان","سمك","كلب","أسد","زرافة","فيل","نمر","تمساح","حوت","بطة","دجاجة"]
    var foodArr : [String] = ["خبز","بسبوسة","لبنة","جبن","حليب","لحم","عصير","سلطة","خس","فجل","جرجير","خيار","طماط","أرز","فول","عدس","برتقال","تفاح","بطيخ","فراولة","مانجا","أناناس","رقي","موز","عنب","فلفل","زهرة","ذرة","ملح","فلفل أسود","سكر","زعفران"]
    var clothingArr : [String] = ["جاكيت","نفنوف","عباية","دشداشة","جوتي","حجاب","جوارب","شنطة","مجوهرات","حلق","عقد","حزام","غترة","عقال","كبوس","قفازات","بنطلون","قميص"]
    var peopleArr : [String] = ["كاشير","عامل نظافة","مدير","شرطي","طيار","طبيب","إمام","محامي","ممرض","مدرس"]
    var houseArr : [String] = ["بيت","باب","درج","دريشة","حديقة","جرس","لمبة","سجادة","تلفون","طاولة","تلفزيون","قنفة","راديو","مرايا","خزانة","أبجورة","سرير","مخدة","بطانية","ساعة","كرسي","مطبخ","قلاص","صحن","شوكة","سكين","جدر","ثلاجة","فرن","طاسة"]
    var bodypartArr : [String] = ["رأس","بطن","رجل","يد","أنف","أذن","حاجب","عين","أسنان","فم","شعر","ظهر"]
    var nutsArr : [String] = ["فول سوداني","جوز","لوز","فستق","كازو","حب شمسي"]
    var drinksArr : [String] = ["ماء","بيبسي","حليب","قهوة","شاي","عصير"]
    var sportsArr : [String] = ["كرة","سباحة","رماية","مسدس"]
    var transportationsArr : [String] = ["سيارة","باص","دراجة","موقف","إشارة","قطار","طيارة","تاير","بنزين","حزام الأمان","جواز سفر","تذكرة طيارة","شارع","مطار"]
    var hygieneArr : [String] = ["حمام","معجون","شامبو","صابونة","فرشاةأسنان","فوطة","مرحاض","عطر","زبالة","مغسلة","أوتي","غسالة","مكنسة","دوش"]
    var othersArr : [String] = ["خوذة","كتاب","بطارية","مقص","نظارة","كمبيوتر","طابعة","قلم رصاص","قلم حبر","أشعة","دواء","جرح","سماعة أذن","كرسي متحرك","مسباح","صلاة","خيمة","بر","نار","بحر","نخلة","وردة","شاحن تلفون","كلينكس","ملعقة","صحن","آلة حاسبة","عربانة","كيس","مطعم"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print(" my category = ",mycategory)
    }
    override func viewWillAppear(_ animated: Bool)
    
    {
        super.viewWillAppear(animated)
        mylabel.isHidden = true
        //print(" my category now is = ",mycategory)
        let myimagename : String = mycategory + String(mycurrentelement) + ".png"
        print(" currently = ",myimagename)
        myimage.image = UIImage(named: myimagename)
        if (mycategory == "an"){
            mylabelsarray = animalsArr
        }
        else if (mycategory == "fd"){
            mylabelsarray = foodArr
        }
        else if (mycategory == "cl"){
            mylabelsarray = clothingArr
        }
        else if (mycategory == "dr"){
            mylabelsarray = drinksArr
        }
   
        else if (mycategory == "pe"){
           mylabelsarray = peopleArr
       }
        else if (mycategory == "ho"){
            mylabelsarray = houseArr
        }
        else if (mycategory == "bp"){
            mylabelsarray = bodypartArr
        }
        else if (mycategory == "nu"){
            mylabelsarray = nutsArr
        }
        else if (mycategory == "sp"){
            mylabelsarray = sportsArr
        }
        else if (mycategory == "tr"){
            mylabelsarray = transportationsArr
        }
        else if (mycategory == "hy"){
            mylabelsarray = hygieneArr
        }
        
        else{
            
        mylabelsarray = othersArr
            
    }
}
               override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func buttonPressed(_ sender: Any) {
        let myprefix : String
        if ((sender as AnyObject).tag == 0){
            print("it is hint")
            myprefix = "h_"
        }
        else if ((sender as AnyObject).tag == 1){
            print("it is first letter")
            myprefix = "f_"
        }
        else{
          print("it is say it")
            mylabel.isHidden = false
            mylabel.text = mylabelsarray[mycurrentelement]
            myprefix = ""
        }
       
        let myaudiofilename : String =  myLanguage + myprefix + mycategory + String(mycurrentelement)
        let soundUrl = Bundle.main.url(forResource: myaudiofilename, withExtension: "mp3")!
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.ambient)))
            try AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
            audioPlayer!.numberOfLoops = 0
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch _ {
            return print("sound file not found")
        }
    }
    
 @IBAction func homePressed(_ sender: Any) {
        
    }
    
    
    @IBAction func nextbtnPressed(_ sender: Any){
       
        mylabel.isHidden = true
    
         if (mycurrentelement < mylabelsarray.count-1){
           mycurrentelement = mycurrentelement + 1
           let myimagename : String = mycategory + String(mycurrentelement) + ".png"
           myimage.image = UIImage(named: myimagename)
         }
    }
    
    @IBAction func previousbtnPressed(_ sender: Any) {
        print(" previous  ")
        mylabel.isHidden = true
        if (mycurrentelement > 0){
            mycurrentelement-=1
            if (mycurrentelement < mylabelsarray.count-1){
                let myimagename : String = mycategory + String(mycurrentelement) + ".png"
                myimage.image = UIImage(named: myimagename)
            }
        }

    }

}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
