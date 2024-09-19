// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

interface IER20Token {
    function transfer(address, uint256) external returns (bool);
    function approve(address, uint256) external returns(bool);
    function tranferFrom(address, address, uint256) external returns (bool);
    function totalSupply() external view returns (uint256);
    function balanceOf (address) external view returns (uint256);
    function allowance (address, address) external view returns (uint256);
    event Transfer (address indexed from, address indexed to, uint256 value);
    event Approval (address indexed owner, address indexed spender, uint256 value);
    
}

contract Marketplace {
    mapping (uint => Product) internal products;
    uint internal productlength = 0;
    address internal cUsdTokenAddress = 0x874069Fa1Eb16D44d622F2e0Ca25eeA172369b;

    // string internal product;

    function writeProduct(
        
        
        string memory _name,
        string memory _image,
        string memory _description,
        string memory _location,
        uint _price
        
    ) public {
        uint _sold = 0;
        products[productlength] = Product(
            payable(msg.sender),
            _name,
            _image,
            _description,
            _location,
            _price,
            _sold
        );
        productlength++;
    }

    function readProduct(uint _index) public view returns (
        address payable,
        string memory,
        string memory,
        string memory,
        string memory,
        uint,
        uint
        ){
        return (
            products[_index].owner,
            products[_index].name,
            products[_index].image,
            products[_index].description,
            products[_index].location,
            products[_index].price,
            products[_index].sold
        );
    }

    struct Product {
        address payable owner;
        string name;
        string image;
        string description;
        string location;
        uint price;
        uint sold;

    }


    function buyProduct(uint _index) public payable{
        require(
            IER20Token(cUsdTokenAddress).tranferFrom(msg.sender,
            products[_index].owner,
            products[_index].price),
            "Transfer failed."
        );
        products[_index].sold++;
    }
    
    function getProductsLength() public view returns (uint){
        return (productlength);
    }
}