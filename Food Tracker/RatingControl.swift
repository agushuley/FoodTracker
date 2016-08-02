
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
            button.setImage(emptyStarImage, for: UIControlState())
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.highlighted, .selected])

            button.adjustsImageWhenHighlighted = false
            
            buttons += [button]
        }
        ratingButtons = buttons
        
        super.init(coder: aDecoder)
        
        for button in ratingButtons {
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), for: .touchDown)
            addSubview(button)
        }
    }
    
    // MARK: Actions
    
    func ratingButtonTapped(_ button: UIButton) {
        rating = ratingButtons.index(of: button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        
        for (index, button) in ratingButtons.enumerated() {
            button.frame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame.origin.y = 0
            button.frame.size.height = CGFloat(buttonSize)
            button.frame.size.width = CGFloat(buttonSize)
        }
        
        updateButtonSelectionStates()
    }
}
