//
//  Extensions.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-04-06.
//

import Foundation

extension Encodable { //part of the codable protocal that is responsible for encoding it to data
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

/// When you’re registering a new user in an app (like your ToDoList app), you probably want to save their info to Firestore or some other backend. Firestore typically expects data in the format of a [String: Any] dictionary. But in Swift, user models are often structs or classes.
///
///     1. Encodes the Swift object (like a User struct) into JSON Data.
///     2. Converts that data into a [String: Any] dictionary using JSONSerialization.
///     3. Returns that dictionary so you can use it when calling Firestore’s .setData() or .updateData() methods.

// What does JSON do for your app?

//  Your app uses JSON to talk to external services or save structured data (lightweight data format used to represent structured data) :
// •    🧠 Saving user data to Firebase Firestore
// •    ☁️ Sending info to a backend or getting info from an API
// •    📤 Uploading or downloading lists, settings, or anything structured
