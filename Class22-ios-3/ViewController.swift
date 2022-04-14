import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var panel_IMG_slot1: UIImageView!
    @IBOutlet weak var panel_IMG_slot2: UIImageView!
    @IBOutlet weak var panel_IMG_slot3: UIImageView!
    @IBOutlet weak var panel_LBL_score: UILabel!
    var slots: [UIImageView]!
    
    var score:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slots = [panel_IMG_slot1, panel_IMG_slot2, panel_IMG_slot3]
    }


    @IBAction func spinClicked(_ sender: Any) {
        for i in 0..<100 {
            slotFunc();
        }
    }
    
    func slotFunc() {
        //panel_IMG_slot1.image = UIImage(named:"cherry")
        //panel_IMG_slot1.image = #imageLiteral(resourceName: "strawberry")
        //#imageLiteral()
        
        //panel_IMG_slot1.image =
        let IMAGES = [#imageLiteral(resourceName: "strawberry"), #imageLiteral(resourceName: "lemon"), #imageLiteral(resourceName: "cherry"), #imageLiteral(resourceName: "bell"), #imageLiteral(resourceName: "clover"), #imageLiteral(resourceName: "seven")]
        let SCORES = [5, 10, 20, 30, 50, 100]
        
        var rands: [Int] = Array(0 ..< slots.count)
        
        for i in 0 ..< rands.count {
            let rand = Int.random(in: 0 ..< IMAGES.count)
            rands[i] = rand
            slots[i].image = IMAGES[rand]
        }
        
        
        score -= 1;
        let result = checkSlots(arr: rands)
        
        if (result) {
            score += SCORES[rands[0]]
        }
                
        panel_LBL_score.text = "\(score)"
    }
    
    func checkSlots(arr: [Int]) -> Bool {
        let first = arr[0]
        for n in arr {
            if n != first {
                return false;
            }
        }
        return true;
    }
}

