//
//  UIView.swift
//  Easy AutoLayout
//
//  Created by Yildirim Atcioglu on 02.04.22.
//

import UIKit

public extension UIView {
    func constraintsToLayoutGuide(_ layoutGuide: UILayoutGuide) -> [NSLayoutConstraint] {
        self.translatesAutoresizingMaskIntoConstraints = false
        return [
            self.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            self.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            self.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
        ]
    }

    @discardableResult func constrain(to layoutGuide: UILayoutGuide,
                                      by attribute: NSLayoutConstraint.Attribute,
                                      relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                      priority: UILayoutPriority? = nil,
                                      constant: CGFloat = 0) -> UIView {

        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: layoutGuide, attribute: attribute, multiplier: 1, constant: constant)
        if let p = priority {
            constraint.priority = p
        }
        constraint.isActive = true
        return self
    }

    @discardableResult func constrainCenterX(to layoutGuide: UILayoutGuide, priority: UILayoutPriority? = nil, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: layoutGuide, attribute: .centerX, multiplier: 1, constant: constant)

        if let priority = priority {
            constraint.priority = priority
        }

        constraint.isActive = true

        return self
    }

    @discardableResult func constrainCenterY(to layoutGuide: UILayoutGuide, priority: UILayoutPriority? = nil, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: layoutGuide, attribute: .centerY, multiplier: 1, constant: constant)

        if let priority = priority {
            constraint.priority = priority
        }

        constraint.isActive = true

        return self
    }

    @discardableResult func constrainTop(to layoutGuide: UILayoutGuide,
                                         relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                         priority: UILayoutPriority? = nil,
                                         constant: CGFloat = 0) -> UIView {

        self.constrain(to: layoutGuide, by: .top, relatedBy: relation, priority: priority, constant: constant)
    }

    @discardableResult func constrainBottom(to layoutGuide: UILayoutGuide,
                                            relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                            priority: UILayoutPriority? = nil,
                                            constant: CGFloat = 0) -> UIView {

        self.constrain(to: layoutGuide, by: .bottom, relatedBy: relation, priority: priority, constant: constant)
    }

    @discardableResult func constrainLeading(to layoutGuide: UILayoutGuide,
                                             relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                             priority: UILayoutPriority? = nil,
                                             constant: CGFloat = 0) -> UIView {

        self.constrain(to: layoutGuide, by: .leading, relatedBy: relation, priority: priority, constant: constant)
    }

    @discardableResult func constrainTrailing(to layoutGuide: UILayoutGuide,
                                              relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                              priority: UILayoutPriority? = nil,
                                              constant: CGFloat = 0) -> UIView {

        self.constrain(to: layoutGuide, by: .trailing, relatedBy: relation, priority: priority, constant: constant)
    }

    @discardableResult func constrainWidth(to layoutGuide: UILayoutGuide,
                                           relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                           multiplier: CGFloat = 1,
                                           constant: CGFloat = 0,
                                           priority: UILayoutPriority? = nil) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: relation, toItem: layoutGuide, attribute: .width, multiplier: multiplier, constant: constant)
        if let p = priority {
            constraint.priority = p
        }
        constraint.isActive = true

        return self
    }

    @discardableResult func constrainHeight(to layoutGuide: UILayoutGuide,
                                            relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                            multiplier: CGFloat = 1,
                                            constant: CGFloat = 0,
                                            priority: UILayoutPriority? = nil) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: relation, toItem: layoutGuide, attribute: .height, multiplier: multiplier, constant: constant)
        if let p = priority {
            constraint.priority = p
        }
        constraint.isActive = true

        return self
    }

    @discardableResult func constrainCenter(to other: UIView, offset: CGPoint = .zero) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
            .constrainCenterX(to: other, constant: offset.x)
            .constrainCenterY(to: other, constant: offset.y)
    }

    @discardableResult func constrainCenterY(to other: UIView, by attribute: NSLayoutConstraint.Attribute = .centerY, priority: UILayoutPriority? = nil, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: other, attribute: attribute, multiplier: 1, constant: constant)

        if let priority = priority {
            constraint.priority = priority
        }

        constraint.isActive = true
        return self
    }

    @discardableResult func constrainCenterX(to other: UIView, by attribute: NSLayoutConstraint.Attribute = .centerX, priority: UILayoutPriority? = nil, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: other, attribute: attribute, multiplier: 1, constant: constant)

        if let priority = priority {
            constraint.priority = priority
        }

        constraint.isActive = true

        return self
    }

    @discardableResult func constrainTop(to other: UIView, by attribute: NSLayoutConstraint.Attribute = .top, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority? = nil, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.constrain(attribute: .top, to: other, otherAttribute: attribute, relatedBy: relation, priority: priority, constant: constant)
    }

    @discardableResult func constrainBottom(to other: UIView, by attribute: NSLayoutConstraint.Attribute = .bottom, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.constrain(attribute: .bottom, to: other, otherAttribute: attribute, relatedBy: relation, priority: priority, multiplier: multiplier, constant: constant)
    }

    @discardableResult func constrainLeading(to other: UIView, by attribute: NSLayoutConstraint.Attribute = .leading, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority? = nil, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.constrain(attribute: .leading, to: other, otherAttribute: attribute, relatedBy: relation, priority: priority, constant: constant)
    }

    @discardableResult func constrainTrailing(to other: UIView, by attribute: NSLayoutConstraint.Attribute = .trailing, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority? = nil, constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.constrain(attribute: .trailing, to: other, otherAttribute: attribute, relatedBy: relation, priority: priority, constant: constant)
    }

    @discardableResult func constrainAspectRatio(widthToHeight: CGFloat) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: widthToHeight, constant: 0).isActive = true
        return self
    }

    @discardableResult func constrain(height: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority? = nil) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height)
        if let p = priority {
            constraint.priority = p
        }
        NSLayoutConstraint.activate([constraint])
        return self
    }

    @discardableResult func constrain(size: CGSize, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority? = nil) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.constrain(width: size.width, relation: relation, priority: priority)
        self.constrain(height: size.height, relation: relation, priority: priority)
        return self
    }

    @discardableResult func constrain(width: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority? = nil) -> UIView {
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width)
        if let p = priority {
            constraint.priority = p
        }
        NSLayoutConstraint.activate([constraint])
        return self
    }

    @discardableResult private func constrain(attribute: NSLayoutConstraint.Attribute,
                                              to other: UIView,
                                              otherAttribute: NSLayoutConstraint.Attribute,
                                              relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                              priority: UILayoutPriority? = nil,
                                              multiplier: CGFloat = 1,
                                              constant: CGFloat = 0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: other, attribute: otherAttribute, multiplier: multiplier, constant: constant)
        if let p = priority {
            constraint.priority = p
        }
        NSLayoutConstraint.activate([constraint])
        return self
    }
}
