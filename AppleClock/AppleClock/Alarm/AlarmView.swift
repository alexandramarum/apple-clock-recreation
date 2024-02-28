//
//  AlarmView.swift
//  AppleClock
//
//  Created by Alexandra Marum on 11/30/23.
//

import Foundation
import SwiftUI

struct AlarmView: View {
    @StateObject var vm = AlarmViewModel()
    @State var isShowingSheet = false
    
    var body: some View {
        NavigationStack {
            ScrollView{
                Section {
                    VStack{
                        HStack {
                            Image(systemName: "bed.double.fill")
                            Text("Sleep | Wake Up")
                                .font(.title2)
                                .bold()
                            Spacer()
                        }
                        Divider()
                        HStack {
                            Text("No Alarm")
                                .font(.title3)
                                .foregroundColor(.secondary)
                            Spacer()
                            Button{
                            } label: {
                                Text("SET UP")
                                    .bold()
                                    .padding(9)
                                    .background(
                                        RoundedRectangle(
                                            cornerRadius: 20
                                        )
                                        .fill(Color.white
                                            .opacity(0.15))
                                    )
                            }
                        }
                        Divider()
                    }
                }.padding()
                
                Section{
                    VStack{
                        HStack {
                            Text("Other")
                                .font(.title2)
                                .bold()
                            Spacer()
                        }
                        ForEach(vm.alarms.indices, id: \.self) { index in
                            AlarmRowView(vm: vm, alarm: $vm.alarms[index])
                        }
                        
                    }
                    
                }.padding()
                    .navigationTitle("Alarm")
                    .navigationBarItems(
                        leading:
                            Button {
                                
                            } label: {
                                Text("Edit")
                                
                            },
                        trailing:
                            Button {
                                isShowingSheet.toggle()
                            } label: {
                                Image(systemName: "plus")
                            }
                            .sheet(isPresented: $isShowingSheet) {
                                SheetView(isShowingSheet: $isShowingSheet, vm: vm, sheetVm: SheetViewModel())
                            }
                    )
            }
            .preferredColorScheme(.dark)
            .accentColor(.orange)
        }
    }
}

#Preview {
    AlarmView(vm: AlarmViewModel(), isShowingSheet: false)
}
