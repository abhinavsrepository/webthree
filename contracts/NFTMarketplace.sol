// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//internal import for net openzwlin 
 import "@openzeppelin/contracts/utils/Counters.sol";
 import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage";
 import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
 import "hardhat/console.sol";

 contract NFTMarketplace is ERC721URIStorage{
    using Counters for Counter.Counter;

    Counters.Counter private _tokenIds;
    Counters.Counter private_itemsSold;

    uint256 listingPrice = 0.0015 ether;
    address payable owner ;

    mapping (uint256 => MarketItem ) private idMarketItem;

    struct MarketItem {
        uint256 tokeId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;

    }
    event idMarketItemCreated(
        uint256 indexed tokenId,
        address seller,
        address owner,
        uint256 price,
        bool sold

    );
    modifier onlyOwner{
        require(msg.sender == owner, "only owner of the marketplace can change the listing price ")
    }
    constructor() ERC721("NFT Metaverse Token","MYNFT"){
        owner == payable(msg.sender);

    }
    function updateListingPrice(uint256 _ListingPrice) public payable onlyOwner{
        listingPrice = _listingPrice;
    }
    function getListingPrice() public view returns(uint256){
        return listingPrice;
    }
    // Let create "Create NFT token FUNCTION"
    function createToken(string memory tokenURI,uint256 price ) public payable return (uint256){
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();
    
    _mint(msg.sender ,newTokenId);
    
    _setTokenURI(newTokenId,tokenURI);

    createMarketItem(newTokenId,price);
    return newTokenId;
    }
    // creating market items
    function createMarketItem( uint256 tokenId,uint256 price)private{
        require(price>0 , "Price must be atleast 1");
        require(msg.value == listingPrice,"Price must be equal to lis" );
        idMarketItem[tokenId] =MarketItem(
            tokenId,
            payable(msg.sender),
            payable(address(this)),
            price, 
            false,

        )
    }
 }