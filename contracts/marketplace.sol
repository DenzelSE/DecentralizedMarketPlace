// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract Marketplace {
    mapping (uint => Product) internal products;
    uint internal productlength = 0;

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
    function getProductsLength() public view returns (uint){
        return (productlength);
    }
}