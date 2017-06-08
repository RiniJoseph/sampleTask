//
//  ViewController.swift
//  cigna_Box
//
//  Created by Rini Joseph on 07/06/17.
//  Copyright © 2017 cccuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
  @IBOutlet weak var boxCollectionView: UICollectionView!
  @IBOutlet weak var countTextfield: UITextField!
  @IBOutlet weak var submitButton: UIButton!
  var boxCount: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    countTextfield.keyboardType = UIKeyboardType.numberPad
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  
  @IBAction func submitAction(_ sender: Any) {
    if countTextfield.text == "" {
      boxCount = 0
      boxCollectionView.reloadData()
      let alertController = UIAlertController(title: "", message:AppConstants.emptyerrorMessage, preferredStyle: UIAlertControllerStyle.alert)
      let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
        (result : UIAlertAction) -> Void in
        alertController.dismiss(animated: true, completion: nil)
      }
      alertController.addAction(okAction)
      self.present(alertController, animated: true, completion: nil)
    }
    else if let countBox = Int(countTextfield.text ?? "") {
      if countBox > AppConstants.maxCount {
        boxCount = 0
        boxCollectionView.reloadData()
        countTextfield.text = ""
        let alertController = UIAlertController(title: "", message: String(format:AppConstants.countlimitMessage,AppConstants.maxCount), preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
          (result : UIAlertAction) -> Void in
          alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
      }
      else {
        self.boxCount =  countBox
        boxCollectionView.reloadData()
      }
    }
    
  }
  
  // MARK: - UICollectionViewDataSource protocol
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return boxCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoxCell", for: indexPath as IndexPath) as! BoxCollectionViewCell
    cell.isHidden = false
    return cell
  }
  
  
  
}

