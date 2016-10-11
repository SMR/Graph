//
//  SecondViewController.swift
//  Charting Demo
//
//  Created by Samarjeet dubey on 08/10/16.
//  Copyright © 2016 iSparshIT. All rights reserved.
//

import UIKit
import JBChart

class SecondViewController: UIViewController, JBLineChartViewDelegate, JBLineChartViewDataSource {

    @IBOutlet weak var lineChart: JBLineChartView!
    @IBOutlet weak var informationLabel: UILabel!
    
    var charttime = ["12:00-1:00", "12:00-2:00", "12:00-3:00", "12:00-4:00", "12:00-5:00", "12:00-6:00", "12:00-8:00","12:00-9:00","12:00-10:00","12:00-11:00","12:00-12:00"]
    var chartSignal = [0, 0, 45, 32, 90, 0, 74,80, 76,90, 69]
    var lastYearChartData = [75, 88, 79, 95, 72, 55, 90,69, 74,80, 76]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.darkGrayColor()
        
        // line chart setup
        lineChart.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.6)
        lineChart.delegate = self
        lineChart.dataSource = self
        lineChart.minimumValue = 55
        lineChart.maximumValue = 100
        
        lineChart.reloadData()
        
        lineChart.setState(.Collapsed, animated: false)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let footerView = UIView(frame: CGRectMake(0, 0, lineChart.frame.width, 16))
        
        print("viewDidLoad: \(lineChart.frame.width)")
        
        let footer1 = UILabel(frame: CGRectMake(0, 0, lineChart.frame.width/2 - 8, 16))
        footer1.backgroundColor = UIColor.redColor()
        footer1.textColor = UIColor.blackColor()
        footer1.text = "\(charttime[0])"
        
        let footer2 = UILabel(frame: CGRectMake(lineChart.frame.width/2 - 8, 0, lineChart.frame.width/2 - 8, 16))
        footer2.backgroundColor = UIColor.greenColor()
        footer2.textColor = UIColor.whiteColor()
        footer2.text = "\(charttime[charttime.count - 1])"
        footer2.textAlignment = NSTextAlignment.Center
        
        footerView.addSubview(footer1)
        footerView.addSubview(footer2)
        
        let header = UILabel(frame: CGRectMake(0, 0, lineChart.frame.width, 50))
        header.backgroundColor = UIColor.yellowColor()
        header.textColor = UIColor.whiteColor()
        header.font = UIFont.systemFontOfSize(24)
        header.text = "Chart Demo  SAMAR"
        header.textAlignment = NSTextAlignment.Center
        
        lineChart.footerView = footerView
        lineChart.headerView = header
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // our code
        lineChart.reloadData()
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(SecondViewController.showChart), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        hideChart()
    }
    
    func hideChart() {
        lineChart.setState(.Collapsed, animated: true)
    }
    
    func showChart() {
        lineChart.setState(.Expanded, animated: true)
    }
    
    // MARK: JBlineChartView
    
    func numberOfLinesInLineChartView(lineChartView: JBLineChartView!) -> UInt {
        return 1
    }
    
    func lineChartView(lineChartView: JBLineChartView!, numberOfVerticalValuesAtLineIndex lineIndex: UInt) -> UInt {
        if (lineIndex == 0) {
            return UInt(chartSignal.count)
        } //else if (lineIndex == 1) {
//            return UInt(lastYearChartData.count)
//        }
        
        return 0
    }
    
    func lineChartView(lineChartView: JBLineChartView!, verticalValueForHorizontalIndex horizontalIndex: UInt, atLineIndex lineIndex: UInt) -> CGFloat {
        if (lineIndex == 0) {
            return CGFloat(chartSignal[Int(horizontalIndex)])
        }// else if (lineIndex == 1) {
           // return CGFloat(lastYearChartData[Int(horizontalIndex)])
       // }
        
        return 0
    }
    
    func lineChartView(lineChartView: JBLineChartView!, colorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        if (lineIndex == 0) {
            return UIColor.blackColor()
        } //else if (lineIndex == 1) {
           // return UIColor.blackColor()
       // }
        
        return UIColor.blackColor()
    }
    
    func lineChartView(lineChartView: JBLineChartView!, showsDotsForLineAtLineIndex lineIndex: UInt) -> Bool {
//        if (lineIndex == 0) { return true }
//        else if (lineIndex == 1) { return false }
//        
        return false
    }
    
    func lineChartView(lineChartView: JBLineChartView!, colorForDotAtHorizontalIndex horizontalIndex: UInt, atLineIndex lineIndex: UInt) -> UIColor! {
        return UIColor.grayColor()
    }
    
    func lineChartView(lineChartView: JBLineChartView!, smoothLineAtLineIndex lineIndex: UInt) -> Bool {
//        if (lineIndex == 0) { return false }
//        else if (lineIndex == 1) { return true }
//        
        return true
    }
    
    func lineChartView(lineChartView: JBLineChartView!, didSelectLineAtIndex lineIndex: UInt, horizontalIndex: UInt) {
        if (lineIndex == 0) {
            let data = chartSignal[Int(horizontalIndex)]
            let key = charttime[Int(horizontalIndex)]
            informationLabel.text = "Value on \(key): \(data)"
        } //else if (lineIndex == 1) {
          //  let data = lastYearChartData[Int(horizontalIndex)]
          //  let key = charttime[Int(horizontalIndex)]
           // informationLabel.text = "Value last year on \(key): \(data)"
       // }
    }
    
    func didDeselectLineInLineChartView(lineChartView: JBLineChartView!) {
        informationLabel.text = ""
    }
    
    func lineChartView(lineChartView: JBLineChartView!, fillColorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        if (lineIndex == 0) {
            return UIColor.lightGrayColor().colorWithAlphaComponent(0.6)
        }
        
        return UIColor.clearColor()
    }
}

