//
//  ViewController.swift
//  滑動選單
//
//  Created by Cxicl on 2017/6/21.
//  Copyright © 2017年 Cxicl. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate
{

    var viewServerBool = false
    var viewServer:UIView!
    var buttonPing:UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let serv = UIBarButtonItem(title: "選單", style: .plain, target: self, action: #selector(server))
        navigationItem.leftBarButtonItem = serv
        
    }

    func server()
    {
        if viewServerBool == false
        {
            viewServer = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: (self.navigationController?.view.bounds.size.height)!))
            viewServer.backgroundColor = UIColor.white
            viewServer.layer.shadowColor = UIColor.black.cgColor
            viewServer.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            viewServer.layer.shadowOpacity = 0.5
            buttonPing = UIButton(frame: CGRect(x: 0.0, y: 60.0, width: 100.0, height: 80.0))
            buttonPing.setTitle("下一個頁面", for: .normal)
            buttonPing.addTarget(self, action: #selector(go), for: .touchUpInside)
            buttonPing.setTitleColor(UIColor.blue, for: .normal)
            viewServer.addSubview(buttonPing)
            self.navigationController?.view.superview?.addSubview(viewServer)
            menu()
            viewServerBool = true
        }
        else
        {
            menu()
            viewServerBool = false
            self.viewServer.removeFromSuperview()
        }
    }

    func go()
    {
        self.viewServer.removeFromSuperview()
        self.menu()
        let mainQuqu = DispatchQueue.main
        mainQuqu.async
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "test") as! test
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    func menu()
    {
        if viewServerBool == false
        {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0,initialSpringVelocity: 0, options: .curveEaseInOut, animations:
                {
                    
                    self.navigationController?.view.frame.origin.x = 300.0
            }, completion: nil)

        }
        else
        {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0,initialSpringVelocity: 0, options: .curveEaseInOut, animations:
                {
                    
                    self.navigationController?.view.frame.origin.x = 0.0
            }, completion: nil)

        }
        
    }

    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        
        if viewServerBool == true
        {
            viewServer.removeFromSuperview()
            viewServerBool = false
        }
        
    }


    
}

