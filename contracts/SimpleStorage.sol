// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; // harus ada semicolon

contract SimpleStorage {
    // ini isinya = 0
    uint256 favoriteNumber;

    mapping(string => uint256) public nameToFavoriteNumber;

    // ini kaya bikin object, tapi disini People menjadi new type
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // ini array
    // uint256[] public anArray;
    People[] public people;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view dan pure tidak menggunakan gas
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    // calldata, memory, & storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}