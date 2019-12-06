//
//  AddReportViewController.swift
//  AppRestoration
//
//  Created by Julio Collado on 12/4/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class AddReportViewController: RestorableBaseViewController {
    
    @IBOutlet weak var reportNumberTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    private static let activityNumberKey = "reportNumber"
    private static let activityContentKey = "reportContent"
    
    var report: Report?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let reportContent = self.report?.content, let reportNumber = self.report?.reportNumber {
            contentTextView.text = reportContent
            reportNumberTextField.text = reportNumber
        }
    }
    
    override func applyUserActivityEntries(_ activity: NSUserActivity) {
        let itemNumber: [String: String] = [AddReportViewController.activityNumberKey: reportNumberTextField.text ?? ""]
        activity.addUserInfoEntries(from: itemNumber)
        
        let itemContent: [String: String] = [AddReportViewController.activityContentKey: contentTextView.text]
        activity.addUserInfoEntries(from: itemContent)
        
        let viewControllerRestoreIdentifier: [String: String] = [Constants.ViewControllerStateIdentifiers.viewControllerRestorationIdentifier: Constants.ViewControllerStateIdentifiers.addReportViewController]
        activity.addUserInfoEntries(from: viewControllerRestoreIdentifier)
    }
    
    override func restoreItemInterface(_ activityUserInfo: [AnyHashable: Any]) {
        guard let itemNumber = activityUserInfo[AddReportViewController.activityNumberKey] as? String, let itemContent = activityUserInfo[AddReportViewController.activityContentKey] as? String else {
            return
        }
        report = Report(reportNumber: itemNumber, content: itemContent)
    }
    
}

extension AddReportViewController: Loadable {
    static func loadFromStoryboard() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "AddReportViewController") as? AddReportViewController
    }
    
}
