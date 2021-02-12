//
//  SearchBar.swift
//
//  Created by Franklyn Weber on 11/02/2021.
//

import SwiftUI
import InputAccessoryTextField


public struct SearchBar<T: SearchBarShowing>: View, Identifiable {
    
    @StateObject private var viewModel: T
    @State private var isEditing = false
    
    public let id = "SearchBar"
    
    internal var placeHolder: String?
    internal var recentsSectionTitle: String?
    internal var resultsSectionTitle: String?
    internal var searchTextColor: Color?
    internal var searchTextBackgroundColor: Color?
    internal var searchBarBackgroundColor: Color?
    internal var recentsTextColor: Color?
    internal var recentsBackgroundColor: Color?
    internal var resultsTextColor: Color?
    internal var resultsBackgroundColor: Color?
    internal var cancelButtonColor: Color?
    internal var maxRecents: Int = 3
    internal var maxResults: Int = .max
    internal var verticalPadding = CGFloat(0)
    internal var dismissOnSelection = true
    
    
    public init(_ viewModel: T) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    
    public var body: some View {
        
        VStack {
            
            HStack {
                
                InputAccessory.TextField(parentView: self, text: viewModel.searchTerm)
                    .placeholder(placeHolderValue())
                    .foregroundColor(searchTextColor ?? Color(.label))
                    .hideToolBar
                    .returnKey(type: .search) {
                        viewModel.selectedSearchTerm = viewModel.searchTerm.wrappedValue
                        finish()
                    }
                    .insets(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                    .endInput(!isEditing)
                    .padding(7)
                    .background(searchTextBackgroundColor ?? Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(EdgeInsets(top: 5 + verticalPadding, leading: 8, bottom: 5 + verticalPadding, trailing: 8))
                    .onTapGesture {
                        isEditing = true
                    }
                    .animation(.default)
                    .overlay(
                        
                        HStack {
                            
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(textFieldButtonColor())
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .offset(x: 17)
                            
                            Button(action: {
                                viewModel.searchTerm.wrappedValue = ""
                            }, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(textFieldButtonColor())
                            })
                            .offset(x: -17)
                            .opacity(isEditing && !viewModel.searchTerm.wrappedValue.isEmpty ? 1 : 0)
                            .animation(.default)
                        }
                    )
                
                if isEditing {
                    
                    Button {
                        finish()
                    } label: {
                        Text(NSLocalizedString("Cancel", bundle: Bundle.module, comment: "Cancel"))
                            .foregroundColor(cancelButtonColor ?? Color(.link))
                    }
                    .padding(.trailing, 12)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
            .background(searchBarBackgroundColor ?? Color(.systemBackground))
            
            if isEditing, !viewModel.searchResults.isEmpty {
                
                List {
                    
                    if !viewModel.recentSearchSelections.isEmpty {
                        Section(header: Text(recentsSectionTitle ?? NSLocalizedString("Recents", bundle: Bundle.module, comment: "Recents")).font(.caption)) {
                            ForEach(viewModel.recentSearchSelections.prefix(maxRecents), id: \.self) { item in
                                T.SearchListItemType(content: item, textColor: recentsTextColor)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        viewModel.selectedSearchTerm = item.searchTerm
                                        if dismissOnSelection {
                                            finish()
                                        }
                                    }
                            }
                            .listRowBackground(recentsBackgroundColor ?? Color(.systemBackground))
                        }
                    }
                    
                    Section(header: Text(resultsSectionTitle ?? NSLocalizedString("Results", bundle: Bundle.module, comment: "Results")).font(.caption)) {
                        ForEach(viewModel.searchResults.prefix(maxResults), id: \.self) { item in
                            T.SearchListItemType(content: item, textColor: resultsTextColor)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    viewModel.selectedSearchTerm = item.searchTerm
                                    if dismissOnSelection {
                                        finish()
                                    }
                                }
                        }
                        .listRowBackground(resultsBackgroundColor ?? Color(.systemBackground))
                    }
                }
                .padding(.top, -8)
                .transition(.opacity)
            }
        }
        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
    
    private func placeHolderValue() -> InputAccessory.TextField<Self>.PlaceHolder? {
        
        guard let placeHolder = placeHolder else {
            return nil
        }
        
        let attributedString = NSAttributedString(string: placeHolder, attributes: [.foregroundColor: UIColor(searchTextColor ?? Color(.label)).withAlphaComponent(0.3)])
        
        return .attributed(attributedString)
    }
    
    private func textFieldButtonColor() -> Color {
        return searchTextColor != nil ? Color(UIColor(searchTextColor!).withAlphaComponent(0.3)) : Color(.systemGray3)
    }
    
    private func finish() {
        viewModel.searchTerm.wrappedValue = ""
        isEditing = false
    }
}
