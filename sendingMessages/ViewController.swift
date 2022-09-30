//
//  ViewController.swift
//  sendingMessages
//
//  Created by Natan Gluszko on 29/09/2022.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate{
    

    let messageViewController = MFMailComposeViewController()
    let smsViewController = MFMessageComposeViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageViewController.mailComposeDelegate = self
        smsViewController.messageComposeDelegate = self
        
    }

    @IBAction func btnCompose(_ sender: UIButton) {
        
        if !MFMailComposeViewController.canSendMail() {
            print("mail service are not available")
        }
        else {
            messageViewController.setToRecipients(["address@example.com"])
            messageViewController.setSubject("Hello!")
            messageViewController.setMessageBody("Hi it's me natan!", isHTML: false)
            self.present(messageViewController, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func smsBtn(_ sender: Any) {
        
        if !MFMessageComposeViewController.canSendText() {
            print("SMS service are not available")
        }
        else {
            smsViewController.recipients = ["4085551212"]
            smsViewController.body = "This is a message"
            present(smsViewController, animated: true, completion: nil)
            
        }
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
     dismiss(animated: true, completion: nil)
     }

    
    
    
    
}

