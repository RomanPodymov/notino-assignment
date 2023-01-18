//
//  NotinoAssets.swift
//  NotinoAssets
//
//  Created by Roman Podymov on 18/01/2023.
//  Copyright © 2023 NotinoAssets. All rights reserved.
//

import Foundation
import PDFKit
import UIKit

public class NotinoAssets {
    public static let resourceBundle: Bundle = {
        let bundle = Bundle(for: NotinoAssets.self)
        let resourceBundleURL = bundle.url(forResource: "NotinoAssets", withExtension: "bundle")
        let resourceBundle = Bundle(url: resourceBundleURL!)
        return resourceBundle!
    }()

    public static let heart: UIImage = {
        let url = resourceBundle.url(forResource: "heart", withExtension: "pdf")
        return drawPDFfromURL(url: url!)!
    }()

    public static let heartBold: UIImage = {
        let url = resourceBundle.url(forResource: "heart-bold", withExtension: "pdf")
        return drawPDFfromURL(url: url!)!
    }()

    public static let icoStarGrey: UIImage = {
        let url = resourceBundle.url(forResource: "ico-star-grey", withExtension: "pdf")
        return drawPDFfromURL(url: url!)!
    }()

    public static let icoStarPink: UIImage = {
        let url = resourceBundle.url(forResource: "ico-star-pink", withExtension: "pdf")
        return drawPDFfromURL(url: url!)!
    }()

    private static func drawPDFfromURL(url: URL) -> UIImage? {
        guard let document = CGPDFDocument(url as CFURL) else { return nil }
        guard let page = document.page(at: 1) else { return nil }

        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)

            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)

            ctx.cgContext.drawPDFPage(page)
        }

        return img
    }
}

