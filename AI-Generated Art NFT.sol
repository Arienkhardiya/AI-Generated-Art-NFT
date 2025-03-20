pragma solidity ^0.8.0;

contract DynamicNFT {
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => string) private _tokenURIs;
    uint256 private _tokenIdCounter;

    function mint(address to, string memory tokenURI) public {
        uint256 tokenId = _tokenIdCounter;
        _owners[tokenId] = to;
        _balances[to] += 1;
        _tokenURIs[tokenId] = tokenURI;
        _tokenIdCounter++;
    }

    function ownerOf(uint256 tokenId) public view returns (address) {
        return _owners[tokenId];
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function tokenURI(uint256 tokenId) public view returns (string memory) {
        return _tokenURIs[tokenId];
    }

    function updateTokenURI(uint256 tokenId, string memory newURI) public {
        require(_owners[tokenId] != address(0), "Token does not exist");
        _tokenURIs[tokenId] = newURI;
    }
}
