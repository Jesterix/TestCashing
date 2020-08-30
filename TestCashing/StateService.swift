//
//  StateService.swift
//  TestCashing
//
//  Created by Georgy Khaydenko on 30.08.2020.
//  Copyright © 2020 Georgy Khaydenko. All rights reserved.
//

import Disk

class StateService {
    let stateFileName = "state.json"
    
    
    func saveState(screenIndex: Int, text: String) {
        let currentState: AppState? = retrieveState()
        
        if var state = currentState {
            switch screenIndex {
            case 1:
                state.text = text
            default:
                break
            }
            state.screen = screenIndex
            do {
                try Disk.save(state, to: .caches, as: stateFileName)
            } catch {
                //error handling
            }
        } else {
            let state: AppState = .init(screen: screenIndex, text: text)
            do {
                try Disk.save(state, to: .caches, as: stateFileName)
            } catch {
                //error handling
            }
        }
    }
    
    func retrieveState() -> AppState? {
        var currentState: AppState?
        
        if Disk.exists(stateFileName, in: .caches) {
            do {
                currentState = try Disk.retrieve(stateFileName, from: .caches, as: AppState.self)
            } catch {
                //error handling
            }
        }
        return currentState
    }
}
