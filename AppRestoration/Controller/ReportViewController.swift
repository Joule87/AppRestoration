//
//  ReportViewController.swift
//  AppRestoration
//
//  Created by Julio Collado on 12/3/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class ReportViewController: BaseViewController {
    
    @IBOutlet weak var reportTableView: UITableView!
    
    var reportArray = [Report]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        autoFillReports()
    }
    
    func autoFillReports() {
        for i in 0..<10 {
            let content = "\(i): njans fjn sajnfj sdak jfsjaf kndsa lnfas dn asn fadsjf ;asdf kjnsadfk skjdnaf djaf sdjnf sadfkj asnf njs sjdj"
            let report = Report(reportNumber: "\(i)", content: content)
            reportArray.append(report)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vcDestination = segue.destination as? ReportDetailViewController, let indexPath = reportTableView.indexPathForSelectedRow else { return }
        vcDestination.report = reportArray[indexPath.row]
    }
    
}

extension ReportViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = "Report: \(reportArray[indexPath.row].reportNumber)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SegueReportDetail", sender: self)
    }
    
}
