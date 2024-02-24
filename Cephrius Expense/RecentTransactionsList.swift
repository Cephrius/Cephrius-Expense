//
//  RecentTransactionsList.swift
//  CephriusExpense
//
//  Created by Chiedozie Ehileme on 2/23/24.
//

import SwiftUI

struct RecentTransactionsList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                // MARK: Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                // MARK: Header Link
                NavigationLink {
                    TransactionList()
                    
                } label: {
                    HStack(spacing: 4, content: {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    })
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            
            // MARK: Recent Transaction List
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element) {
                inedx, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionsList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            RecentTransactionsList()
            RecentTransactionsList()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        .environmentObject(transactionListVM)
        
        
    }
}
