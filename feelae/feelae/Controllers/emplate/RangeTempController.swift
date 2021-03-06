import UIKit

class RangeTempController: UIViewController {
    
    let navigation: NavigationControllerDelegate = NavigationControllerDelegate()
    var valueSlider : Float = 0.0
    var question : Question? = nil
    var response = ""
    
    @IBOutlet weak var ReturnButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var rangeSubtitle: UILabel!
    @IBOutlet weak var rangeTitle: UILabel!
    @IBOutlet weak var slider: UISlider! {
        didSet{
            slider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        }
    }
    @IBAction func slider(_ sender: UISlider) {
        sliderLabel.text = String(format:"%.2f", sender.value) + "°C"
        self.valueSlider = sender.value
    }
    
    @IBAction func ReturnButtonChecked(_ sender: UIButton) {
        // self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func viewTapped(_ sender: UIButton) {
        
        if(self.valueSlider > 38.00){
             self.response = "38.0"
        }else if(self.valueSlider < 37.00){
            self.response = "37.0"
        }else{
            self.response = "autre"
        }
        
        let controllerToSend = navigation.ReturnPageType(question: question!, response: self.response)
        self.changeView(controller: controllerToSend!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rangeTitle.text = question?.getTitle()
        self.rangeSubtitle.text = question?.getSubTitle()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func changeView(controller: UIViewController){
        self.navigationController?.pushViewController(controller, animated: false)
    }
}
