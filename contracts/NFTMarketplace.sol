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
        bool sold,

    );
    constructor() ERC721("NFT Metaverse Token","MYNFT"){
        owner == payable(msg.sender);

    }
    function updateListingPrice(
         
    )
 }