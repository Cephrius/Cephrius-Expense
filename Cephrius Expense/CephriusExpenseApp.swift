//
//  CephriusExpenseApp.swift
//  CephriusExpense
//
//  Created by Chiedozie Ehileme on 2/22/24.
//

import SwiftUI

@main
struct CephriusExpenseApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
