//
//  UIView+Layout.swift
//  SCLayoutKit
//
//  Created by Scott Moon on 08/05/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit

public struct AnchoredConstraints {
  public var top, leading, bottom, trailing, width, height, centerX, centerY: NSLayoutConstraint?
}

public enum Relation {
  case equal
  case greatThenOrEqual
  case lessThenOrEqual
}

extension UIView {

  @discardableResult
  public func setTopAnchor(_ anchor: NSLayoutYAxisAnchor, relation: Relation = .equal, padding: CGFloat = 0) -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()

    switch relation {
    case .equal:
      anchoredConstraints.top = topAnchor.constraint(equalTo: anchor, constant: padding)
    case .greatThenOrEqual:
      anchoredConstraints.top = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: padding)
    case .lessThenOrEqual:
      anchoredConstraints.top = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: padding)
    }

    anchoredConstraints.top?.isActive = true

    return self
  }

  @discardableResult
  public func setLeadingAnchor(_ anchor: NSLayoutXAxisAnchor, relation: Relation = .equal, padding: CGFloat = 0) -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()

    switch relation {
    case .equal:
      anchoredConstraints.leading = leadingAnchor.constraint(equalTo: anchor, constant: padding)
    case .greatThenOrEqual:
      anchoredConstraints.leading = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: padding)
    case .lessThenOrEqual:
      anchoredConstraints.leading = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: padding)
    }

    anchoredConstraints.leading?.isActive = true

    return self
  }

  @discardableResult
  public func setBottomAnchor(_ anchor: NSLayoutYAxisAnchor, relation: Relation = .equal, padding: CGFloat = 0) -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()

    switch relation {
    case .equal:
      anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: anchor, constant: -padding)
    case .greatThenOrEqual:
      anchoredConstraints.bottom = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -padding)
    case .lessThenOrEqual:
      anchoredConstraints.bottom = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: -padding)
    }

    anchoredConstraints.bottom?.isActive = true
    return self
  }

  @discardableResult
  public func setTrailingAnchor(_ anchor: NSLayoutXAxisAnchor, relation: Relation = .equal, padding: CGFloat = 0) -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()

    switch relation {
    case .equal:
      anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: anchor, constant: -padding)
    case .greatThenOrEqual:
      anchoredConstraints.trailing = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -padding)
    case .lessThenOrEqual:
      anchoredConstraints.trailing = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: -padding)
    }

    anchoredConstraints.trailing?.isActive = true
    return self
  }

  @discardableResult
  public func setWidthAnchor(_ width: CGFloat) -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()
    anchoredConstraints.width = widthAnchor.constraint(equalToConstant: width)
    anchoredConstraints.width?.isActive = true
    return self
  }

  @discardableResult
  public func setHeightAnchor(_ height: CGFloat) -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()
    anchoredConstraints.height = heightAnchor.constraint(equalToConstant: height)
    anchoredConstraints.height?.isActive = true
    return self
  }

  @discardableResult
  public func setCenterXAnchor(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()
    anchoredConstraints.centerX = centerXAnchor.constraint(equalTo: anchor, constant: offset)
    anchoredConstraints.centerX?.isActive = true
    return self
  }

  @discardableResult
  public func setCenterYAnchor(_ anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()
    anchoredConstraints.centerY = centerYAnchor.constraint(equalTo: anchor, constant: offset)
    anchoredConstraints.centerY?.isActive = true
    return self
  }

  @discardableResult
  public func setSize(_ size: CGSize) -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()

    anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
    anchoredConstraints.width?.isActive = true
    anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
    anchoredConstraints.height?.isActive = true
    return self
  }

  @discardableResult
  public func fillSuperView(padding: UIEdgeInsets = .zero) -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()

    if let superview = superview {
      anchoredConstraints.top = topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top)
      anchoredConstraints.top?.isActive = true

      anchoredConstraints.leading = leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding.left)
      anchoredConstraints.leading?.isActive = true

      anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding.bottom)
      anchoredConstraints.bottom?.isActive = true

      anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding.right)
      anchoredConstraints.trailing?.isActive = true
    }

    return self
  }

  @discardableResult
  public func centerInSuperview(size: CGSize = .zero) -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()

    if let superview = superview {
      anchoredConstraints.centerX = centerXAnchor.constraint(equalTo: superview.centerXAnchor)
      anchoredConstraints.centerX?.isActive = true

      anchoredConstraints.centerY = centerYAnchor.constraint(equalTo: superview.centerYAnchor)
      anchoredConstraints.centerY?.isActive = true

      anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
      anchoredConstraints.width?.isActive = true

      anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
      anchoredConstraints.height?.isActive = true
    }

    return self
  }

  @discardableResult
  public func centerXInSuperView() -> Self {
    translatesAutoresizingMaskIntoConstraints = false

    if let superViewCenterXAnchor = superview?.centerXAnchor {
      centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
    }

    return self
  }

  @discardableResult
  public func centerYInSuperView() -> Self {
    translatesAutoresizingMaskIntoConstraints = false

    if let superViewCenterYAnchor = superview?.centerYAnchor {
      centerYAnchor.constraint(equalTo: superViewCenterYAnchor).isActive = true
    }

    return self
  }

  public func anchor(
    top: NSLayoutYAxisAnchor?,
    leading: NSLayoutXAxisAnchor?,
    bottom: NSLayoutYAxisAnchor?,
    trailing: NSLayoutXAxisAnchor?,
    padding: UIEdgeInsets = .zero,
    size: CGSize = .zero
  ) -> AnchoredConstraints {

    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()

    if let top = top {
      anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
    }

    if let leading = leading {
      anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
    }

    if let bottom = bottom {
      anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
    }

    if let trailing = trailing {
      anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
    }

    if size.width != 0 {
      anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
    }

    if size.height != 0 {
      anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
    }

    [
      anchoredConstraints.top,
      anchoredConstraints.leading,
      anchoredConstraints.bottom,
      anchoredConstraints.trailing,
      anchoredConstraints.width,
      anchoredConstraints.height
    ].forEach {
      $0?.isActive = true
    }

    return anchoredConstraints
  }
}
