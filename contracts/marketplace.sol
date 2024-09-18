// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract Marketplace {
    mapping (uint => string) internal products;

    // string internal product;

    function writeProduct(uint _index, string memory _product) public {
        products[_index] = _product;
    }

    function readProduct(uint _index) public view returns (string memory){
        return products[_index];
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
}