//
//  Grid+Inits_Data.swift
//  ExyteGrid
//
//  Created by Denis Obukhov on 07.05.2020.
//  Copyright © 2020 Exyte. All rights reserved.
//

// swiftlint:disable line_length

import SwiftUI

extension Grid {
    public init<Data, ID>(_ data: Data, id: KeyPath<Data.Element, ID>, tracks: [GridTrack] = 1, contentMode: GridContentMode? = nil, flow: GridFlow? = nil, packing: GridPacking? = nil, spacing: GridSpacing = Constants.defaultSpacing, itemsAlignment: GridAlignment? = nil, cache: GridCacheMode? = nil, gridID: GridID = .Num1, @GridBuilder item: @escaping (Data.Element) -> ConstructionItem) where Data: RandomAccessCollection, ID: Hashable {
        var index = 0
        let items = data.flatMap {
            item($0).contentViews.asGridElements(index: &index,
                            baseHash: AnyHashable([AnyHashable($0[keyPath: id]), AnyHashable(id)]))
        }
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

    public init(_ data: Range<Int>, tracks: [GridTrack] = 1, contentMode: GridContentMode? = nil, flow: GridFlow? = nil, packing: GridPacking? = nil, spacing: GridSpacing = Constants.defaultSpacing, itemsAlignment: GridAlignment? = nil, gridID: GridID = .Num1, cache: GridCacheMode? = nil, @GridBuilder item: @escaping (Int) -> ConstructionItem) {
        var index = 0
        let items = data.flatMap {
            item($0).contentViews.asGridElements(index: &index)
        }
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
    
    public init<Data>(_ data: Data, tracks: [GridTrack] = 1, contentMode: GridContentMode? = nil, flow: GridFlow? = nil, packing: GridPacking? = nil, spacing: GridSpacing = Constants.defaultSpacing, itemsAlignment: GridAlignment? = nil, cache: GridCacheMode? = nil, gridID: GridID = .Num1, @GridBuilder item: @escaping (Data.Element) -> ConstructionItem) where Data: RandomAccessCollection, Data.Element: Identifiable {
        var index = 0
        let items = data.flatMap {
            item($0).contentViews.asGridElements(index: &index,
                            baseHash: AnyHashable($0.id))
        }
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
