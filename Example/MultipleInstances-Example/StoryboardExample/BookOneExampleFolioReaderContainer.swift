//
//  BookOneExampleFolioReaderContainer.swift
//  StoryboardExample
//
//  Created by Panajotis Maroungas on 18/08/16.
//  Copyright © 2016 FolioReader. All rights reserved.
//

import UIKit
import FolioReaderKit

class BookOneExampleFolioReaderContainer: BaseExampleFolioReaderContainer {

    override var exampleReaderConfig: FolioReaderConfig {
        let config = FolioReaderConfig(withIdentifier: "STORYBOARD_READER_ONE")
        config.hidePageIndicator = true
        config.scrollDirection = .horizontalWithVerticalContent
//        config.shouldHideNavigationOnTap = false

        return config
    }

    override var bookTitle: String {
        return "The Adventures Of Sherlock Holmes - Adventure I"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
