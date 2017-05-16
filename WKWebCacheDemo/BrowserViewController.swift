//
//  BrowserViewController.swift
//  NSURLProtocolExample
//
//  Created by Zouhair Mahieddine on 7/10/14.
//  Copyright (c) 2014 Zedenem. All rights reserved.
//

import UIKit
import WebKit

class BrowserViewController: UIViewController, UITextFieldDelegate {
    //https://www.raywenderlich.com/76735/using-nsurlprotocol-swift
    @IBOutlet var textField: UITextField!
    @IBOutlet var webView: UIWebView!
    
    var wkWebView: WKWebView!
    //MARK: IBAction
    
    @IBAction func buttonGoClicked(_ sender: UIButton) {
        if self.textField.isFirstResponder {
            self.textField.resignFirstResponder()
        }
        
        self.wk()
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        self.sendRequest()
        
        return true
    }
    
    //MARK: Private
    
    func sendRequest() {
        if let text = self.textField.text {
            let url = URL(string:text)
            let request = URLRequest(url:url!)
            self.webView.loadRequest(request)
        }
    }
    
    
    func wk() {
        if let url = URL(string: "https://tripnscan.com/f29f5e49-0f0a-4d47-ae08-bd877e291ada?lang_cd=en") {
            // Display sequence images
            
            // init and load request in webview.
            let request = URLRequest(url: url)
            let webViewSize = CGRect(x: 0,
                                     y: 50,
                                     width: self.view.frame.size.width,
                                     height: self.view.frame.size.height - self.webView.frame.size.height)
            wkWebView = WKWebView(frame: webViewSize)
            wkWebView.navigationDelegate = self
            wkWebView.load(request)
            self.view.addSubview(wkWebView)
            self.view.sendSubview(toBack: wkWebView)
        }
    }
}

extension BrowserViewController : WKNavigationDelegate{
    //MARK:- WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start to load")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finish to load")
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
        
    }
    
    
}
