//
//  musicPlayer.swift
//  Filosoffi
//
//  Created by Nadia Leung on 4/14/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import Foundation
import SwiftUI
import MediaPlayer
import AVFoundation

var avMusicPlayer: AVAudioPlayer!
var mediaPicker: MPMediaPickerController!
var mediaItems = [MPMediaItem]()

class Music: UIViewController, MPMediaPickerControllerDelegate {


    var body: some View {
        VStack {
            Button(action: {
                // Get the music player.
                let musicPlayer = MPMusicPlayerApplicationController.applicationQueuePlayer
                // Add a playback queue containing all songs on the device.
                musicPlayer.setQueue(with: .songs())
                // Start playing from the beginning of the queue.
                musicPlayer.play()
            }){
                Text("Play Music")

            }

        }

    }



}


func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool){
    //What to do?
}

func mediaPicker(_ mediaPicker: MPMediaPickerController,
                 didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
    // Get the system music player.
    let musicPlayer = MPMusicPlayerController.systemMusicPlayer
    musicPlayer.setQueue(with: mediaItemCollection)
    mediaPicker.dismiss(animated: true)
    // Begin playback.
    musicPlayer.play()
}

func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
    mediaPicker.dismiss(animated: true)
}

func updatePlayer(){
    let currentIndex = 0
    let item = mediaItems[currentIndex]
    // DO-TRY-CATCH try to setup AVAudioPlayer with the path, if successful, sets up the AVMusicPlayer, and song values.
    if let path: NSURL = item.assetURL as NSURL? {
        do
        {
            avMusicPlayer = try AVAudioPlayer(contentsOf: path as URL)
            avMusicPlayer.enableRate = true
            avMusicPlayer.rate = 1.0
            avMusicPlayer.numberOfLoops = 0
            avMusicPlayer.currentTime = 0
        }
        catch
        {
            avMusicPlayer = nil
        }
    }
}

