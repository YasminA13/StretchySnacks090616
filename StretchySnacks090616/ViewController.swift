//
//  ViewController.swift
//  StretchySnacks090616
//
//  Created by Yasmin Ahmad on 2016-06-09.
//  Copyright © 2016 YasminA. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var headerClosed = true
    let stackView = UIStackView()
    var foodItem = [String]()
    let titleLabel = UILabel()
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var navBarHeight: NSLayoutConstraint!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var oreoButton: UIButton!
    @IBOutlet weak var pizzaButton: UIButton!
    @IBOutlet weak var poptartsButton: UIButton!
    @IBOutlet weak var popsicleButton: UIButton!
    @IBOutlet weak var ramenButton: UIButton!
    @IBOutlet weak var snackTableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        stackView.axis = .Horizontal
        stackView.distribution = .FillEqually
        stackView.alignment = .Fill
        stackView.spacing = 5
        stackView.hidden = false
        headerView.addSubview(stackView)
     
        setUpTitleLabel()

        oreoButton.addTarget(self, action: #selector(ViewController.selectItem(_:)), forControlEvents: .TouchUpInside)
        pizzaButton.addTarget(self, action: #selector(ViewController.selectItem(_:)), forControlEvents: .TouchUpInside)
        poptartsButton.addTarget(self, action: #selector(ViewController.selectItem(_:)), forControlEvents: .TouchUpInside)
        popsicleButton.addTarget(self, action: #selector(ViewController.selectItem(_:)), forControlEvents: .TouchUpInside)
        ramenButton.addTarget(self, action: #selector(ViewController.selectItem(_:)), forControlEvents: .TouchUpInside)
        
    }

    
    @IBAction func hitButton(sender: UIButton) {

        headerClosed = !headerClosed
        navBarHeight.constant = headerClosed ? 66 : 200
        let angle = headerClosed ? 0 : CGFloat(M_PI_4)
        //stackView.hidden = !stackView.hidden
        
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: [], animations: { () in
            
            self.view.layoutIfNeeded()
            self.hitButton.transform = CGAffineTransformMakeRotation(angle)
            
            }, completion: nil)
        
        
        print("Plus button pressed")
        
    }

    
    func selectItem(sender:UIButton){
        switch sender {
        case oreoButton:
            foodItem.insert("Oreos", atIndex: 0)
            
        case pizzaButton:
            foodItem.insert("Pizza", atIndex: 0)
        
        case poptartsButton:
            foodItem.insert("Pop Tart", atIndex: 0)
            
        case popsicleButton:
            foodItem.insert("Popsicle", atIndex: 0)
            
        case ramenButton:
            foodItem.insert("Ramen Noodles", atIndex: 0)
            
        default:
            print("Some other snack")
        }
        
        snackTableView.beginUpdates()
        snackTableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
        snackTableView.endUpdates()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("snackCell", forIndexPath: indexPath) as! SnackTableViewCell
        let snack = foodItem[indexPath.row]
        cell.configureCell(snack)
                
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItem.count
    }
    
    
    func setUpTitleLabel(){
        headerView.addSubview(titleLabel)
        
        headerLabel.text = "SNACKS"
          
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

