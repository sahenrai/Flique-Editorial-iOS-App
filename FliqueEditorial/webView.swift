//
//  webView.swift
//  FliqueEditorial
//
//  Created by Sahen Rai on 9/14/20.
//  Copyright © 2020 Sahen Rai. All rights reserved.
//

import UIKit
import WebKit

class webView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      guard let link = URL(string:"https://www.fliqueeditorial.com") else {return}
      
      print(link)

        let request = URLRequest(url: link)
      
      print(request)
      
        web.load(request)

        
    }


   @IBOutlet weak var web: WKWebView!
   
   @IBAction func subscribe(_ sender: UIButton) {
      
      guard let link = URL(string:"https://www.fliqueeditorial.com/newsletter") else {return}

        let request = URLRequest(url: link)
      

        web.load(request)

   }
}
