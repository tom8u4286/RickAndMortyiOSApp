//
//  CharacterListViewViewModel.swift
//  RickAndMorth
//
//  Created by 曲奕帆 on 2023/6/4.
//

import UIKit

/// 必須要繼承一個Class(如AnyObject，否則在RMCharacterListViewViewModel宣告的characters會無法使用weak宣告。)
///
/// -Authors: Tomtom Chu
/// -Date: 2023.6.18
protocol RMCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
    func didSelectCharacter(_ character: RMCharacter)
}

final class RMCharacterListViewViewModel: NSObject {
    
    public weak var delegate: RMCharacterListViewViewModelDelegate?
    
    private var characters: [RMCharacter] = [] {
        didSet{
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image)
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    
    private var apiInfo: RMGetAllCharactersResponse.Info? = nil
    
    /// 此處取得第一輪(page1)的角色清單(第一個API)。
    /// 在第一個API的reponse中，info資訊中，會給第二頁角色清單的API(第二個API)。
    ///
    /// -Authors: Tomtom Chu
    /// -Date: 2023.6.19
    public func fetchCharacters(){
        RMService.shared.execute(
            .listCharactersRequests,
            expecting: RMGetAllCharactersResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                let info = responseModel.info
                self?.characters = results
                self?.apiInfo = info
                DispatchQueue.main.async{
                    self?.delegate?.didLoadInitialCharacters()
                }
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    public func fetchAddtionalCharacters(){
        // 擷取更多的角色
    }
    
    
    public var shouldShowLoadMoreIndicator: Bool {
        // 如果apiInfo中的next(下一個清單的API URL)不是nil，則要顯示LoadMore的指示。
        return apiInfo?.next != nil
    }
    
    
}

/// CollectionView相關實作。
///
/// -Authors: Tomtom Chu
/// -Date: 2023.6.19
extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    // 設定Cell的數量
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        /// UIScreen.main.bounds回傳該支iPhone的點數長寬，如: (375.0, 812.0)。
        ///
        /// -Authors: Tomtom Chu
        /// -Date: 2023.6.4
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
    }
    
}


// MARK: - ScrollView

extension RMCharacterListViewViewModel: UIScrollViewDelegate {
    
}
