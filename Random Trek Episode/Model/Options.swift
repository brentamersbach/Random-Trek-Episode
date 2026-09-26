//
//  Options.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/29/21.
//

import Foundation

class Options: ObservableObject {
        
    @Published var seriesList: [Series] = []
    
    init() {
        self.seriesList.append(Series(seriesTitle: "The Original Series", abbreviation: "TOS", episodes: []))
        self.seriesList.append(Series(seriesTitle: "The Animated Series", abbreviation: "TAS", episodes: []))
        self.seriesList.append(Series(seriesTitle: "The Next Generation", abbreviation: "TNG", episodes: []))
        self.seriesList.append(Series(seriesTitle: "Deep Space Nine", abbreviation: "DS9", episodes: []))
        self.seriesList.append(Series(seriesTitle: "Voyager", abbreviation: "VOY", episodes: []))
        self.seriesList.append(Series(seriesTitle: "Enterprise", abbreviation: "ENT", episodes: []))
        self.seriesList.append(Series(seriesTitle: "Discovery", abbreviation: "DSC", episodes: []))
        self.seriesList.append(Series(seriesTitle: "Picard", abbreviation: "PIC", episodes: []))
        self.seriesList.append(Series(seriesTitle: "Lower Decks", abbreviation: "LD", episodes: []))
        self.seriesList.append(Series(seriesTitle: "Prodigy", abbreviation: "PRO", episodes: []))
        self.seriesList.append(Series(seriesTitle: "Strange New Worlds", abbreviation: "SNW", episodes: []))
        self.seriesList.append(Series(seriesTitle: "Starfleet Academy", abbreviation: "SA", episodes: []))
    }
}
