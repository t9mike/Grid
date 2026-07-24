//
//  Grid+Inits_TupleView.swift
//  ExyteGrid
//
//  Created by Denis Obukhov on 18.04.2020.
//  Copyright © 2020 Exyte. All rights reserved.
//

// swiftlint:disable line_length

import SwiftUI

extension Grid {
    public init(tracks: [GridTrack] = 1, contentMode: GridContentMode? = nil, flow: GridFlow? = nil, packing: GridPacking? = nil, spacing: GridSpacing = Constants.defaultSpacing, itemsAlignment: GridAlignment? = nil, cache: GridCacheMode? = nil, gridID: GridID = .Num1, @GridBuilder content: () -> ConstructionItem) {
        let content = content()
        var index = 0
        let items = content.contentViews.asGridElements(index: &index)
        self.init(
            items: items,
            trackSizes: tracks,
            spacing: spacing,
            internalContentMode: contentMode,
            internalFlow: flow,
            internalPacking: packing,
            internalCacheMode: cache,
            internalItemsAlignment: itemsAlignment,
            gridID: gridID
        )
    }
}
