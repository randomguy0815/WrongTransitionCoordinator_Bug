import UIKit

class CustomNavigationController: UINavigationController {
    
    let dummyView = UIView()
    var toggleVar = false
    
    // This override needs to be implemented since this init gets called by the other inits internally
    // Also quite strange but not part of the bug !?
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        self.delegate = self
        
        view.insertSubview(dummyView, belowSubview: navigationBar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let tc = self.transitionCoordinator {
            
            //bug also occurs with tc.animate(alongsideTransition: ...
            tc.animateAlongsideTransition(in: dummyView, animation: { context in
                self.setNavbarColor()
            }, completion: { context in
                if context.isCancelled {
                    self.setNavbarColor()
                }
            })
            
        }
    }
    
    func setNavbarColor() {
        //needs to toggle, otherwise there is no animation and the bug does not occur
        navigationBar.backgroundColor = toggleVar ? .yellow : .red
        toggleVar = !toggleVar
    }
}
