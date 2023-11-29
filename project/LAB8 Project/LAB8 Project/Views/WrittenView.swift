//
//  WrittenView.swift
//  LAB8 Project
//
//  Created by 박선구 on 11/28/23.
//

import SwiftUI
import MobileCoreServices

struct Post {
    var title: String
    var content: String
    var image: Image?
}

struct WrittenView: View {
    @State private var post: Post = Post(title: "", content: "", image: nil)
    @State private var isImagePickerPresented: Bool = false
    @State private var isCommunityViewActive: Bool = false
    @State private var isPostSaved: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if let image = post.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                } else {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                }

                Button(action: {
                    isImagePickerPresented.toggle()
                }) {
                    Text("사진과 동영상을 선택하세요")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(hex: 0xF9688D))
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $post.image, isImagePickerPresented: $isImagePickerPresented)
                }

                TextField("제목을 입력하세요", text: $post.title)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(UIColor.systemGray6)))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)

                TextField("내용을 입력하세요", text: $post.content)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(UIColor.systemGray6)))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)

                Spacer()

                Button(action: {
                    if !isPostSaved {
                        savePost()
                        isPostSaved = true
                        isCommunityViewActive = true
                    }
                }) {
                    Text("공유")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(hex: 0xF9688D))
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .background(NavigationLink("", destination: CommunityView(), isActive: $isCommunityViewActive))
            }
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
            .navigationBarTitle("새 게시물", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                isCommunityViewActive = true
            }) {
                Image(systemName: "chevron.left")
                    .font(.headline)
                    .foregroundColor(Color(hex: 0xF9688D))
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    func savePost() {
        print("게시물 저장 완료. 제목: \(post.title), 내용: \(post.content)")
    }
}


struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: Image?
    @Binding var isImagePickerPresented: Bool

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = Image(uiImage: uiImage)
            }

            parent.isImagePickerPresented = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isImagePickerPresented = false
        }
    }

    var sourceType: UIImagePickerController.SourceType = .photoLibrary

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        imagePicker.mediaTypes = [kUTTypeImage as String]
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
}

extension Color {
    init(hex: Int, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}
