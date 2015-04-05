//
//  ViewController.swift
//  WebBrowser
//
//  Created by Liuqing Du on 05/04/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        urlTextField.resignFirstResponder()
        
        loadURL(urlTextField.text, webView: webView)
        
        return true
    }
    
    // load website
    func loadURL(url: String, webView: UIWebView) {
        var nsUrl = NSURL(string: ("http://" + url))
        
        var nsReq = NSURLRequest(URL: nsUrl!)
        
        webView.loadRequest(nsReq)
        
    }
    
    // start loading
    func webViewDidStartLoad(webView: UIWebView) {
        loadingActivityIndicator.startAnimating()
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    // finish loading
    func webViewDidFinishLoad(webView: UIWebView) {
        loadingActivityIndicator.stopAnimating()
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

