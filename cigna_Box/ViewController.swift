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
  var boxCount: Int = 0

  @IBOutlet weak var submitButton: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

 
  @IBAction func submitAction(_ sender: Any) {
    if countTextfield.text == "" {
       boxCount = 0
       boxCollectionView.reloadData()
      let alertController = UIAlertController(title: "", message: "Count cannot be empty!!", preferredStyle: UIAlertControllerStyle.alert)
      let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
        (result : UIAlertAction) -> Void in
        alertController.dismiss(animated: true, completion: nil)
      }
      alertController.addAction(okAction)
      self.present(alertController, animated: true, completion: nil)
    } else if Int(countTextfield.text ?? "")! > 10 {
      boxCount = 0
      boxCollectionView.reloadData()
      countTextfield.text = ""
      let alertController = UIAlertController(title: "", message: "Enter a count less than 10", preferredStyle: UIAlertControllerStyle.alert)
      
      let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
        (result : UIAlertAction) -> Void in
        alertController.dismiss(animated: true, completion: nil)
      }
      alertController.addAction(okAction)
      self.present(alertController, animated: true, completion: nil)
      
    } else {
      self.boxCount =  Int(countTextfield.text ?? "")!
      boxCollectionView.reloadData()
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
  
  // MARK: - UICollectionViewDelegate protocol
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    // handle tap events
    print("You selected cell #\(indexPath.item)!")
  }

}

