//
//  ServiseAPI.swift
//  taskForITRexGroup
//
//  Created by sleman on 8.02.22.
//

import Foundation

class ServiseAPI {
    static var apiSingl = ServiseAPI()
    private init() {}

    let jsonUrl = "https://www.nbrb.by/api/exrates/rates?periodicity=0"
    func fetchUrlSession(completionHandler: @escaping ([Currency]) -> Void) {
        guard let url = URL(string: jsonUrl) else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { [weak self] data, _, _ in
            if let data = data, let users = self?.parseJSON(withData: data) {
                completionHandler(users)
            }
        }
        task.resume()
    }

    private func parseJSON(withData data: Data) -> [Currency]? {
        let decoder = JSONDecoder()
        var currencys: [Currency] = []
        do {
            let fetchCurrencys = try decoder.decode([Currency].self, from: data)
            for item in fetchCurrencys {
                guard let carrency = Currency(currency: item) else { return nil }
                currencys.append(carrency)
            }
            return currencys
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
