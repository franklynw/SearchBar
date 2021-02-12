//
//  File.swift
//  
//
//  Created by Franklyn Weber on 12/02/2021.
//

import SwiftUI


extension SearchBar {
    
    /// Sets the placeholder text in the search field
    /// - Parameter placeHolder: a String
    public func placeHolder(_ placeHolder: String) -> Self {
        var copy = self
        copy.placeHolder = placeHolder
        return copy
    }
    
    /// Sets the title of the "Recents" section of the results - if not used, will default to "Recents"
    /// - Parameter recentsSectionTitle: a String
    public func recentsSectionTitle(_ recentsSectionTitle: String) -> Self {
        var copy = self
        copy.recentsSectionTitle = recentsSectionTitle
        return copy
    }
    
    /// Sets the title of the "Results" section of the results - if not used, will default to "Results"
    /// - Parameter resultsSectionTitle: a String
    public func resultsSectionTitle(_ resultsSectionTitle: String) -> Self {
        var copy = self
        copy.resultsSectionTitle = resultsSectionTitle
        return copy
    }
    
    /// The colour to use for the text in the search field - defaults to Color(.label) if unused
    /// - Parameter searchTextColor: a Color
    public func searchTextColor(_ searchTextColor: Color) -> Self {
        var copy = self
        copy.searchTextColor = searchTextColor
        return copy
    }
    
    /// The colour to use for the search field's background - defaults to Color(.systemGray6) if unused
    /// - Parameter searchTextBackgroundColor: a Color
    public func searchTextBackgroundColor(_ searchTextBackgroundColor: Color) -> Self {
        var copy = self
        copy.searchTextBackgroundColor = searchTextBackgroundColor
        return copy
    }
    
    /// The colour to use for the area surrounding the search field - defaults to Color(.systemBackground) if unused
    /// - Parameter searchBarBackgroundColor: a Color
    public func searchBarBackgroundColor(_ searchBarBackgroundColor: Color) -> Self {
        var copy = self
        copy.searchBarBackgroundColor = searchBarBackgroundColor
        return copy
    }
    
    /// The colour to use for the text of the recent items - defaults to Color(.label) if unused
    /// - Parameter recentsTextColor: a Color
    public func recentsTextColor(_ recentsTextColor: Color) -> Self {
        var copy = self
        copy.recentsTextColor = recentsTextColor
        return copy
    }
    
    /// The colour to use for the background of the recents area of the results list - defaults to Color(.systemBackground) if unused
    /// - Parameter recentsBackgroundColor: a Color
    public func recentsBackgroundColor(_ recentsBackgroundColor: Color) -> Self {
        var copy = self
        copy.recentsBackgroundColor = recentsBackgroundColor
        return copy
    }
    
    /// The colour to use for the text of the result items - defaults to Color(.label) if unused
    /// - Parameter resultsTextColor: a Color
    public func resultsTextColor(_ resultsTextColor: Color) -> Self {
        var copy = self
        copy.resultsTextColor = resultsTextColor
        return copy
    }
    
    /// The colour to use for the background of the results area of the results list - defaults to Color(.systemBackground) if unused
    /// - Parameter resultsBackgroundColor: a Color
    public func resultsBackgroundColor(_ resultsBackgroundColor: Color) -> Self {
        var copy = self
        copy.resultsBackgroundColor = resultsBackgroundColor
        return copy
    }
    
    /// The colour to use for the Cancel button - defaults to Color(.link) if unused
    /// - Parameter cancelButtonColor: a Color
    public func cancelButtonColor(_ cancelButtonColor: Color) -> Self {
        var copy = self
        copy.cancelButtonColor = cancelButtonColor
        return copy
    }
    
    /// The maximum number of rows to show in the recents section - defaults to 3 if unused
    /// - Parameter maxRecents: an Int value
    public func maxRecents(_ maxRecents: Int) -> Self {
        var copy = self
        copy.maxRecents = maxRecents
        return copy
    }
    
    /// The maximum number of rows to show in the results section - defaults to unlimited if unused
    /// - Parameter maxResults: an Int value
    public func maxResults(_ maxResults: Int) -> Self {
        var copy = self
        copy.maxResults = maxResults
        return copy
    }
    
    /// Additional padding around the search field, split evenly top & bottom
    /// - Parameter verticalPadding: a CGFloat value
    public func verticalPadding(_ verticalPadding: CGFloat) -> Self {
        var copy = self
        copy.verticalPadding = verticalPadding
        return copy
    }
    
    /// Use this to prevent the default behaviour of dismissing the results list & resigning first responder from the search field when the user selects an item from the results
    public var disableDismissOnSelection: Self {
        var copy = self
        copy.dismissOnSelection = false
        return copy
    }
}
