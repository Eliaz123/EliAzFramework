
import Foundation
import UIKit

public func NSLog (string: String) {
    let name = Bundle.main.infoDictionary!["CFBundleName"] as! String
    print("\(NSDate()) \(name) \(string)")
}



open class Logging:UIViewController {
    var rect = UIView(frame: CGRect(x: 30, y: 30, width: 50, height: 50))
    
    
    public func UploadView(){
        rect.backgroundColor = UIColor.orange
        self.view!.addSubview(rect)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.pan))
        rect.addGestureRecognizer(pan)
    }
    @objc public func pan(g : UIPanGestureRecognizer)  {
        switch g.state {
        case .ended:
            print("Ended")
            print(g.location(in: self.view))
        case .began:
            print(g.location(in: self.view))
            
            print("begin")
        case .changed:
            self.rect.center = g.location( ofTouch: 0, in: self.view)
            if g.location(in: self.view).x>100
            {
                if g.location(in: self.view).y>100{
                    view!.backgroundColor = UIColor.magenta
                    
                    rect.backgroundColor = UIColor.red
                }else{
                    view!.backgroundColor = UIColor.gray
                    
                    rect.backgroundColor = UIColor.yellow
                }
                
            }else if g.location(in: self.view).y>100{
                view!.backgroundColor = UIColor.yellow
                
                rect.backgroundColor = UIColor.blue
                
            }else {
                view!.backgroundColor = UIColor.black
                rect.backgroundColor = UIColor.green
                
            }
            print(g.location(in: self.view))
            
        default:
            print("hello")
        }
    }
    public func testMethod() {
        print("Test Method")
    }
    public class func testClassMethod() {
        print("Test Class Method")
    }
}
