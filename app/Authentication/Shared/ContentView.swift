//
//  ContentView.swift
//  Shared
//
//  Created by 坂本唯斗 on 2023/02/18.
//

import SwiftUI
import Python

struct FormView: View {
    @State var preText: String = ""
        @State var text: String = ""

        var body: some View {
            VStack {
                Form {
                    Section {
                        TextField("", text: $preText)
                            .padding(.horizontal)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 250)
                    }
                }
                Button(action: {
                    text = preText
                }) {
                    Text("パスワードを設定する")
                        .font(.callout)
                        .fontWeight(.bold)
                        .lineLimit(0)
                        .frame(width: 250.0)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                }
                .padding(.horizontal, -7.0)
            }
        }
}

func GetCode() {
    
}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Button("コードを取得") {
                let sys = Python.import("sys")
                sys.path.append("~/work/Authenticator/") // example.pyのあるディレクトリへのパス
                let example = Python.import("auth") // パイソンファイルをimport
                example.read_config() // Pythonのファンクションをよぶ
            }
            Text("設定")
                .font(.body)
                .foregroundColor(Color.red)
                .padding(.bottom, 0.0)
            FormView()
                //                NSApp.orderFrontStandardAboutPanel("a")
                //                withAnimation {
                //                    showingPopUp = true
                //                }
                //                let path = NSHomeDirectory() + "/Documents/LoveLetterForReply.txt"
                //                let text = "書き込みたい内容"
                //                do {
                //                    // テキストの書き込みを実行
                //                    try text.write(toFile: path, atomically: true, encoding: .utf8)
                //                    print("成功\nopen", path)
                //
                //                } catch {
                //                    //　テストの書き込みに失敗
                //                    print("失敗:", error )
                //                }
                
                //
                //            NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
                //
                //            NSApp.activate(ignoringOtherApps: true)
            
            
            Divider()
            Button("Quit App") {
                NSApp.terminate(nil)
            }
        }
    }
}

struct PopupView: View {
    @Binding var isPresent: Bool
    var body: some View {
        VStack(spacing: 12) {
            Text("Snorlax")
                .font(Font.system(size: 18).bold())
            
            Image("icon")
                .resizable()
                .frame(width: 80, height: 80)
            
            Text("Snorlax (Japanese: カビゴン Kabigon) is a Normal-type Pokemon. Snorlax is most popular Pokemon.")
                .font(Font.system(size: 18))
            
            Button(action: {
                withAnimation {
                    isPresent = false
                }
            }, label: {
                Text("Close")
            })
        }
        .frame(width: 280, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
