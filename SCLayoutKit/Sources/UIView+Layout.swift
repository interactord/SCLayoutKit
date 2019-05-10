//
//  UIView+Layout.swift
//  SCLayoutKit
//
//  Created by Scott Moon on 08/05/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit

struct AnchoredConstraints {
	var top, leading, bottom, trailing, width, height, centerX, centerY: NSLayoutConstraint?
}

extension UIView {

	@discardableResult
	public func setTopAnchor(_ anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0) -> Self {
		translatesAutoresizingMaskIntoConstraints = false
		var anchoredConstraints = AnchoredConstraints()
		anchoredConstraints.top = topAnchor.constraint(equalTo: anchor, constant: padding)
		anchoredConstraints.top?.isActive = true

		return self
	}

	@discardableResult
	public func setLeadingAnchor(_ anchor: NSLayoutXAxisAnchor, padding: CGFloat = 0) -> Self {
		translatesAutoresizingMaskIntoConstraints = false
		var anchoredConstraints = AnchoredConstraints()
		anchoredConstraints.leading = leadingAnchor.constraint(equalTo: anchor, constant: padding)
		anchoredConstraints.leading?.isActive = true

		return self
	}

	@discardableResult
	public func setBottomAnchor(_ anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0) -> Self {
		translatesAutoresizingMaskIntoConstraints = false
		var anchoredConstraints = AnchoredConstraints()
		anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: anchor, constant: -padding)
		anchoredConstraints.bottom?.isActive = true
		return  self
	}

	@discardableResult
	public func setTrailingAnchor(_ anchor: NSLayoutXAxisAnchor, padding: CGFloat = 0) -> Self {
		translatesAutoresizingMaskIntoConstraints = false
		var anchoredConstraints = AnchoredConstraints()
		anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: anchor, constant: -padding)
		anchoredConstraints.trailing?.isActive = true
		return  self
	}

	@discardableResult
	public func setWithAnchor(_ width: CGFloat) -> Self {
		translatesAutoresizingMaskIntoConstraints = false
		var anchoredConstraints = AnchoredConstraints()
		anchoredConstraints.width = widthAnchor.constraint(equalToConstant: width)
		anchoredConstraints.width?.isActive = true
		return  self
	}

	@discardableResult
	public func setHeightAnchor(_ height: CGFloat) -> Self {
		translatesAutoresizingMaskIntoConstraints = false
		var anchoredConstraints = AnchoredConstraints()
		anchoredConstraints.height = heightAnchor.constraint(equalToConstant: height)
		anchoredConstraints.height?.isActive = true
		return  self
	}

	@discardableResult
	public func setSize(_ size: CGSize) -> Self {
		translatesAutoresizingMaskIntoConstraints = false
		var anchoredConstraints = AnchoredConstraints()

		anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
		anchoredConstraints.width?.isActive = true
		anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
		anchoredConstraints.height?.isActive = true
		return  self
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
	public func centerInSuperview(size: CGSize = .zero) -> Self  {
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



}
