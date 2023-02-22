//
//  TestView.swift
//  M5Learning
//
//  Created by Craig on 2/19/23.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack (alignment: .leading){
                
                // question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .font(.largeTitle)
                
                // question
                CodeTextView()
                
                //answers
                
                // button, submit
                
                // button, complete test
                
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test", displayMode: .inline)
            .padding()
        }
        else {
            ProgressView()
        }
    }
}
/*
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
*/
