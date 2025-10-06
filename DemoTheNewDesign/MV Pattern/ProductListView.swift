//
//  ProductListView.swift
//  DemoTheNewDesign
//
//  Created by Ayokunle Fatokimi on 04/10/2025.
//

import SwiftUI

struct Product: Decodable, Identifiable {
    var id: Int?
    var title: String?
    var slug: String?
    var price: Double?
    var description: String?
}

struct CreateAProduct: Encodable {
    var title: String
    var price: Double
    var description: String
    var categoryId: String?
}

struct HTTPClient {
    func getProductList() async throws -> [Product] {
        let (data, _) = try await URLSession.shared
            .data(from: .init(string: "https://api.escuelajs.co/api/v1/products")!)
        return try JSONDecoder()
            .decode([Product].self, from: data)
    }
    
    func getProductList2() async -> [Product] {
        do {
            let (data, _) = try await URLSession.shared
                .data(from: .init(string: "https://api.escuelajs.co/api/v1/products")!)
            do {
                return try JSONDecoder()
                    .decode([Product].self, from: data)
            } catch {
                
            }
        } catch {
            
        }
        return []
    }
    
    func createProduct(requestObj: CreateAProduct) async throws -> Product? {
        var request = URLRequest(url: .init(string: "https://api.escuelajs.co/api/v1/products")!)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(requestObj)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Product.self, from: data)
    }
}

struct ProductListView: View {
    @State var productData: [Product] = []
    @State var searchText: String = ""
    
    private func getProduct() async -> [Product] {
        let data = try? await HTTPClient().getProductList()
        return data ?? []
    }
    
    private func getProduct2() async -> [Product] {
        await HTTPClient().getProductList2()
    }
    
    var body: some View {
        VStack {
            List(productData.sorted { $0.title?.lowercased() ?? "" < $1.title?.lowercased() ?? "" }) { product in
                Text(product.title ?? "")
            }
        }

        .searchable(text: $searchText, placement: .navigationBarDrawer)
        .navigationTitle("Platzi Products")
        .task {
//            do {
//                let data = try await HTTPClient().getProductList()
//                print(data.first?.title ?? "-")
//                productData = data
//            }
//            catch {
//                print(error.localizedDescription)
//            }
            
//            do {
//                let data = await HTTPClient().getProductList2()
//                print(data.first?.title ?? "-")
//                productData = data
//            }
            productData = await getProduct()
        }
    }
}

#Preview {
    NavigationStack {
        ProductListView()
    }
}
