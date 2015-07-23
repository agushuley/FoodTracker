
import UIKit

class RatingControl: UIView {
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var spacing = 5
    var stars = 5
    let ratingButtons: [UIButton];

    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        var buttons = [UIButton]()
        for _ in 0..<stars {
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])

            button.adjustsImageWhenHighlighted = false
            
            buttons += [button]
        }
        ratingButtons = buttons
        
        super.init(coder: aDecoder)
        
        for button in ratingButtons {
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            addSubview(button)
        }
    }
    
    // MARK: Actions
    
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < rating
        }
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        
        for (index, button) in ratingButtons.enumerate() {
            button.frame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame.origin.y = 0
            button.frame.size.height = CGFloat(buttonSize)
            button.frame.size.width = CGFloat(buttonSize)
        }
        
        updateButtonSelectionStates()
    }
}
