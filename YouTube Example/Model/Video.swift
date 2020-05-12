/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class Video: NSObject {
  let url: URL
  let thumbURL: URL
  let title: String
  let subtitle: String
    var isPlay : Bool

  init(url: URL, thumbURL: URL, title: String, subtitle: String ,isPlay : Bool ) {
    self.url = url
    self.thumbURL = thumbURL
    self.title = title
    self.subtitle = subtitle
    self.isPlay = isPlay
    super.init()
  }
  
  class func localVideos() -> [Video] {
    var videos: [Video] = []
    let names = ["newYorkFlip", "bulletTrain", "monkey", "shark"]
    let titles = ["New York Flip", "Bullet Train Adventure", "Monkey Village", "Robot Battles"]
    let subtitles = ["Can this guys really flip all of his bros? You'll never believe what happens!",
                     "Enjoying the soothing view of passing towns in Japan",
                     "Watch as a roving gang of monkeys terrorizes the top of this mountain!",
                     "Have you ever seen a robot shark try to eat another robot?"]
    
    for (index, name) in names.enumerated() {
      let urlPath = Bundle.main.path(forResource: name, ofType: "mp4")!
      let url = URL(fileURLWithPath: urlPath)
      let thumbURLPath = Bundle.main.path(forResource: name, ofType: "png")!
      let thumbURL = URL(fileURLWithPath: thumbURLPath)
      
        let video = Video(url: url, thumbURL: thumbURL, title: titles[index], subtitle: subtitles[index], isPlay: false)
      videos.append(video)
    }
    return videos
  }
  
  class func allVideos() -> [Video] {
    var videos = localVideos()
    
//    let arrVidURL = ["https://v.pinimg.com/videos/720p/77/4f/21/774f219598dde62c33389469f5c1b5d1.mp4","https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4","https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4","https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4"]
//
    
    
    let arrVidURL = [
        "https://v.pinimg.com/videos/720p/77/4f/21/774f219598dde62c33389469f5c1b5d1.mp4",
        "https://v.pinimg.com/videos/720p/75/40/9a/75409a62e9fb61a10b706d8f0c94de9a.mp4",
        "https://v.pinimg.com/videos/720p/0d/29/18/0d2918323789eabdd7a12cdd658eda04.mp4",
        "https://v.pinimg.com/videos/720p/dd/24/bb/dd24bb9cd68e9e25d1def88cad0a9ea7.mp4",
        "https://v.pinimg.com/videos/720p/d5/15/78/d51578c69d36c93c6e20144e9f887c73.mp4",
        "https://v.pinimg.com/videos/720p/c2/6d/2b/c26d2bacb4a9f6402d2aa0721193e06e.mp4",
        "https://v.pinimg.com/videos/720p/62/81/60/628160e025f9d61b826ecc921b9132cd.mp4",
        "https://v.pinimg.com/videos/720p/5f/aa/3d/5faa3d057eb31dd05876f622ea2e7502.mp4",
        "https://v.pinimg.com/videos/720p/65/b0/54/65b05496c385c89f79635738adc3b15d.mp4",
        "https://v.pinimg.com/videos/720p/86/a1/c6/86a1c63fc58b2e1ef18878b7428912dc.mp4"
    ]
    
 
    
    // Add one remote video
        for item in arrVidURL {
            
            if let url = URL(string: item) {
                let thumbURLPath = Bundle.main.path(forResource: "bulletTrain", ofType: "png")
                let thumbURL = URL(fileURLWithPath: thumbURLPath!)
                let remoteVideo = Video(url: url, thumbURL: thumbURL, title: "Food", subtitle: "Will we be mauled by vicious Earth? Tune in to find out!" , isPlay: false)
                videos.append(remoteVideo)
            }
        }
    return videos
  }
}

