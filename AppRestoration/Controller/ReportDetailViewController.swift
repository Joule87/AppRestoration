//
//  ReportDetailViewController.swift
//  AppRestoration
//
//  Created by Julio Collado on 12/3/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class ReportDetailViewController: RestorableBaseViewController {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    var report: Report?
    
    private static let activityNumberKey = "reportNumber"
    private static let activityContentKey = "reportContent"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let reportContent = self.report?.content {
            contentLabel.text = reportContent
        }
    }
    
    override func applyUserActivityEntries(_ activity: NSUserActivity) {
        super.applyUserActivityEntries(activity)
        let itemNumber: [String: String] = [ReportDetailViewController.activityNumberKey: report!.reportNumber]
        activity.addUserInfoEntries(from: itemNumber)
        
        let itemContent: [String: String] = [ReportDetailViewController.activityContentKey: report!.content]
        activity.addUserInfoEntries(from: itemContent)
        
        let viewControllerRestoreIdentifier: [String: String] = [Constants.ViewControllerStateIdentifiers.viewControllerRestorationIdentifier: Constants.ViewControllerStateIdentifiers.reportDetailViewController]
        activity.addUserInfoEntries(from: viewControllerRestoreIdentifier)
    }
    
    override func restoreItemInterface(_ activityUserInfo: [AnyHashable: Any]) {
        guard let itemNumber = activityUserInfo[ReportDetailViewController.activityNumberKey] as? String, let itemContent = activityUserInfo[ReportDetailViewController.activityContentKey] as? String else {
            return
        }
        report = Report(reportNumber: itemNumber, content: itemContent)
    }
    
}

extension ReportDetailViewController: Loadable {
    static func loadFromStoryboard() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "ReportDetailViewController") as? ReportDetailViewController
    }
    
}
