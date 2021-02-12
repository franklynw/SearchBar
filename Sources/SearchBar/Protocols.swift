//
//  Protocols.swift
//  
//
//  Created by Franklyn Weber on 12/02/2021.
//

import SwiftUI


/// The object (eg, viewModel) controlling the searchBar must conform to this protocol
public protocol SearchBarShowing: ObservableObject {
    
    /// The type of the items used to populate the search results list
    associatedtype SearchListItemType: SearchBarListItem
    
    /// A bound String for the viewModel to use to search
    var searchTerm: Binding<String> { get }
    
    /// The results obtained by the viewModel
    var searchResults: [SearchListItemType.Content] { get }
    
    /// Recent results from the viewModel - optional
    var recentSearchSelections: [SearchListItemType.Content] { get }
    
    /// This will be set on the viewModel when the user either selects from the list or presses the Search button on the keyboard
    var selectedSearchTerm: String { get set }
}

public extension SearchBarShowing {
    
    var recentSearchSelections: [String] {
        return []
    }
}


/// To use custom items for populating the results list, they must conform to this protocol
public protocol SearchBarListItem: View {
    
    /// Whatever content is used, is must implement SearchBarTermContaining
    associatedtype Content: SearchBarTermContaining
    
    /// Required initialiser for search result items
    /// - Parameters:
    ///   - content: the content of the item
    ///   - textColor: an optional Color for the item
    init(content: Content, textColor: Color?)
}


/// Protocol which must be implemented by the content of the search result items
public protocol SearchBarTermContaining: Hashable {
    
    /// The searchTerm text
    var searchTerm: String { get }
}


/// If a standard list is required (text only) set the SearchListItemType typealias to "Text"
extension Text: SearchBarListItem {
    
    public typealias Content = String
    
    public init(content: String, textColor: Color?) {
        self = Text(content)
    }
}


/// Conforming String to SearchBarTermContaining so it can be used for text-only results
extension String: SearchBarTermContaining {
    
    public var searchTerm: String {
        return self
    }
}
