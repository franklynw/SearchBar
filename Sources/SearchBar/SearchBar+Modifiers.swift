//
//  File.swift
//  
//
//  Created by Franklyn Weber on 12/02/2021.
//

import SwiftUI


extension SearchBar {
    
    public func placeHolder(_ placeHolder: String) -> Self {
        var copy = self
        copy.placeHolder = placeHolder
        return copy
    }
    
    public func recentsSectionTitle(_ recentsSectionTitle: String) -> Self {
        var copy = self
        copy.recentsSectionTitle = recentsSectionTitle
        return copy
    }
    
    public func resultsSectionTitle(_ resultsSectionTitle: String) -> Self {
        var copy = self
        copy.resultsSectionTitle = resultsSectionTitle
        return copy
    }
    
    public func searchTextColor(_ searchTextColor: Color) -> Self {
        var copy = self
        copy.searchTextColor = searchTextColor
        return copy
    }
    
    public func searchTextBackgroundColor(_ searchTextBackgroundColor: Color) -> Self {
        var copy = self
        copy.searchTextBackgroundColor = searchTextBackgroundColor
        return copy
    }
    
    public func searchBarBackgroundColor(_ searchBarBackgroundColor: Color) -> Self {
        var copy = self
        copy.searchBarBackgroundColor = searchBarBackgroundColor
        return copy
    }
    
    public func recentsTextColor(_ recentsTextColor: Color) -> Self {
        var copy = self
        copy.recentsTextColor = recentsTextColor
        return copy
    }
    
    public func recentsBackgroundColor(_ recentsBackgroundColor: Color) -> Self {
        var copy = self
        copy.recentsBackgroundColor = recentsBackgroundColor
        return copy
    }
    
    public func resultsTextColor(_ resultsTextColor: Color) -> Self {
        var copy = self
        copy.resultsTextColor = resultsTextColor
        return copy
    }
    
    public func resultsBackgroundColor(_ resultsBackgroundColor: Color) -> Self {
        var copy = self
        copy.resultsBackgroundColor = resultsBackgroundColor
        return copy
    }
    
    public func cancelButtonColor(_ cancelButtonColor: Color) -> Self {
        var copy = self
        copy.cancelButtonColor = cancelButtonColor
        return copy
    }
    
    public func maxRecents(_ maxRecents: Int) -> Self {
        var copy = self
        copy.maxRecents = maxRecents
        return copy
    }
    
    public func maxResults(_ maxResults: Int) -> Self {
        var copy = self
        copy.maxResults = maxResults
        return copy
    }
    
    public func verticalPadding(_ verticalPadding: CGFloat) -> Self {
        var copy = self
        copy.verticalPadding = verticalPadding
        return copy
    }
    
    public var disableDismissOnSelection: Self {
        var copy = self
        copy.dismissOnSelection = false
        return copy
    }
}
