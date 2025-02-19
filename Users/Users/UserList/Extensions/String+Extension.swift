//
//  String+Extension.swift
//  Users
//
//  Created by Berkan Çalışkan on 19.02.2025.
//

extension String {
    func getFirstLetters() -> String {
        let words = self.split(separator: " ").filter { !$0.isEmpty }
        let initials = words.compactMap { $0.first?.uppercased() }
        let result = initials.prefix(3).joined()
        return result.isEmpty ? "🧒🏻" : result
    }
}
