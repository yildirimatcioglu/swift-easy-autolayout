# Swift Easy Autolayout
This repo includes easy autolayout implementation with extension of UIView with using Swift Language

# Usage:

       self.completeButton
           .constrainTop(to: self.view)
           .constrainLeading(to: self.view, constant: Constants.contentMargin)
           .constrainTrailing(to: self.view, by: .trailing, constant: -Constants.contentMargin)
           .constrainCenterY(to: self.contentView)
           .constrain(width: Constants.buttonSize)
           .constrain(height: Constants.buttonSize) 
