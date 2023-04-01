//
//  ArticleRowView.swift
//  News
//
//  Created by Roman Riepa on 31.03.2023.
//

import SwiftUI

struct ArticleRowView: View {
    
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: article.imageURL) { phase in
                switch phase {
                case .empty:
                    HStack {
                        ProgressView()
                        Spacer()
                    }
                    
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }
                    
                    @unknown default:
                    fatalError()
                }
            }
            .frame(minHeight: 200, maxHeight: 300)
            .background(Color.gray.opacity(0.3))
            .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(3)
                
                Text(article.descriptionText)
                    .font(.subheadline)
                    .lineLimit(3)
                
                HStack {
                    Text(article.captionText)
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                        .font(.caption)
                    
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Image(systemName: "bookmark")
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        presentShareSheet(url: article.artiocleURL)
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .buttonStyle(.bordered)

                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}


extension View {
    func presentShareSheet(url: URL) {
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?
            .rootViewController?
            .present(activityVC, animated: true)
    }
}

// код которы предложил Chat он работает

//struct ShareSheet: UIViewControllerRepresentable {
//    let activityItems: [Any]
//    let applicationActivities: [UIActivity]?
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
//        UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
//    }
//
//    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheet>) {}
//
//    func asUIViewController() -> UIViewController {
//        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
//        return controller
//    }
//}
//
//extension View {
//    func presentShareSheet(url: URL) {
//        let shareSheet = ShareSheet(activityItems: [url], applicationActivities: nil)
//        UIApplication.shared.windows.first?.rootViewController?.present(shareSheet.asUIViewController(), animated: true)
//    }
//}


struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            List {
                ArticleRowView(article: .previewData[0])
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(.plain)
        }
    }
}
