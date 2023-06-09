//
//  BaseExampleFolioReaderContainer.swift
//  StoryboardExample
//
//  Created by Panajotis Maroungas on 18/08/16.
//  Copyright © 2016 FolioReader. All rights reserved.
//

import UIKit
import FolioReaderKit

class BaseExampleFolioReaderContainer: FolioReaderContainer {

    var exampleReaderConfig: FolioReaderConfig {
        // To be implented by subclasses
        let config = FolioReaderConfig()
        config.hidePageIndicator = true
//        config.shouldHideNavigationOnTap = true
//        config.hideBars = true
        return config
    }

    var bookTitle: String {
        // To be implented by subclasses
        return ""
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let config = self.exampleReaderConfig

        // Print the chapter ID if one was clicked
        // A chapter in "The Silver Chair" looks like this "<section class="chapter" title="Chapter I" epub:type="chapter" id="id70364673704880">"
        // To know if a user tapped on a chapter we can listen to events on the class "chapter" and receive the id value
        let listener = ClassBasedOnClickListener(schemeName: "chaptertapped", querySelector: ".chapter", attributeName: "id", onClickAction: { (attributeContent: String?, touchPointRelativeToWebView: CGPoint?) in
            print("chapter with id: " + (attributeContent ?? "-") + " clicked")
        })
        config.classBasedOnClickListeners.append(listener)

        guard let bookPath = Bundle.main.path(forResource: self.bookTitle, ofType: "epub") else { return }
        setupConfig(config, epubPath: bookPath)
    }
}
