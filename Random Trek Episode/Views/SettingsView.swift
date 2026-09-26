//
//  ContentView.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/27/21.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Properties
    
    @EnvironmentObject var applicationOptions: Options
    
    @State private var isShowingResult = false
    
    //MARK: - App Logic Methods
    
    func toggleAllOn() {
        for i in applicationOptions.seriesList.indices {
            let currentSeries = $applicationOptions.seriesList[i]
            currentSeries.isSelected.wrappedValue = true
        }
    }
    
    func toggleAllOff() {
        for i in applicationOptions.seriesList.indices {
            let currentSeries = $applicationOptions.seriesList[i]
            currentSeries.isSelected.wrappedValue = false
        }
    }
    
    //MARK: - View hierarchy
    
    var body: some View {
        NavigationView() {
            VStack() {
                Form() {
                    Section(header: Text("Series Selection")) {
                        ForEach(applicationOptions.seriesList.indices, id: \.self) { i in
                            Toggle(isOn: $applicationOptions.seriesList[i].isSelected) {
                                Text(applicationOptions.seriesList[i].abbreviation)
                            }
                        }

                    }

                }
                .navigationTitle(Text("LCARS Access"))
                .navigationBarHidden(false)
                //                .frame(height: 460)

                //                Divider()

                VStack() {
                    Text("Toggle All")
                    HStack() {
                        Spacer()
                        Button(action: toggleAllOn) {
                            Text("On")
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                        .clipShape(Capsule())

                        Spacer()

                        Button(action: toggleAllOff) {
                            Text("Off")
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                        .clipShape(Capsule())

                        Spacer()
                    }
                }

                Spacer()

                NavigationLink(destination: ResultView()
                    .environmentObject(applicationOptions), isActive: $isShowingResult) {
                        if !isShowingResult {
                            Button(action: { isShowingResult.toggle() }) {
                                Text("Show Result")
                                    .padding()
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                    .clipShape(Capsule())
                            }
                        } else {
                            EmptyView()
                        }
                    }

                Spacer()
            }
        }
        .onAppear() {
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
                isShowingResult = false
            } else {
                isShowingResult = true
            }
        }
        .padding()
        .navigationBarHidden(false)
    }
}

//MARK: - Previews

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Options())
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
        SettingsView()
            .environmentObject(Options())
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12")
    }
}

