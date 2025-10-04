//
//  ProductListView.swift
//  DemoTheNewDesign
//
//  Created by Ayokunle Fatokimi on 04/10/2025.
//

import SwiftUI

struct Product: Decodable, Identifiable, Equatable {
    var id: Int?
    var title: String?
    var slug: String?
    var price: Double?
    var description: String?
}

struct HTTPClient {
    func getProductList() async throws -> [Product] {
        let (data, _) = try await URLSession.shared.data(from: .init(string: "[GET] https://api.escuelajs.co/api/v1/products")!)
        
        return try JSONDecoder().decode([Product].self, from: data)
    }
}

struct ProductListView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ProductListView()
}
