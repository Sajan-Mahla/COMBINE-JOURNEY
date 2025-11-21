//
//  GitHubViewModel.swift
//  GitHubUser
//
//  Created by SAJAN  on 21/11/25.
//

import Combine
import Foundation

class GitHubViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var user: GitHubUser?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()

    init() {
        $username
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .filter { !$0.isEmpty }
            .handleEvents(receiveOutput: { _ in
                self.isLoading = true
                self.errorMessage = nil
            })
            .flatMap { username -> AnyPublisher<GitHubUser, Error> in
                guard let url = URL(string: "https://api.github.com/users/\(username)") else {
                    return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
                }

                return URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .decode(type: GitHubUser.self, decoder: JSONDecoder())
                    .eraseToAnyPublisher()
            }
            .receive(on: RunLoop.main)
            .sink { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                    self.user = nil
                }
            } receiveValue: { user in
                self.user = user
            }
            .store(in: &cancellables)
    }

}
