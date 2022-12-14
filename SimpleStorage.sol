// SPDX-License-Identifier: MIT

// Latest right now 0.8.17
// pragma solidity 0.8.7; // Use exact version
// pragma solidity ^0.8.7; // Use any version above the mentioned one - could be 0.8.12 or 0.8.17 or 0.9.5
// pragma solidity >=0.8.7 <0.9.0; // Use version in specified range

pragma solidity ^0.8.8;

contract SimpleStorage {
    /*
      // Data Types: boolean, uint, int, address, bytes
      bool hasFavoriteNumber = true;
      uint256 favoriteNumber = 13;
      int256 favoriteNumberInt = -13;
      address myAddress = 0x4EE163a06a2deE907ff6b594F8e393e9fDC75bf3;
      // Strings are basically bytes object. Strings get converte to bytes object
      string favoriteNumberInText = "Thirteen";
      // bytes can be just bytes (which means it can be of any size) 
      // or bytes32, bytes2, bytes25, bytes29 etc - bytes32 is the max size for bytes
      bytes32 favoriteBytes = "cat";
    */

    // Custom Type with struct
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // when visibility modifier is not mentioned, it is considered as private
    uint256 favoriteNumber; //  By default iniitialized to null value which is 0

    People[] public people;

    // Mapping initialize every key to a null value, for uint256 it is 0
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // "view" and "pure" are the keywords that notate a function that doesn't have to spend gas to run
    // view function disallow any modification of state, and it means we just want to read the state
    // pure function also disallow any modification of state, but it does not allow to read from the state either, we can do stuff only in local scope
    // if a non-pure or non-view function calls pure or view functions, only then these function will cost gas
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // Total 6 places to store information in EVM - Data Locations
    // 3 majors are: calldata, memory, storage - Others are Stack, Code, Logs
    // calldata are parameters that can not be modified, they are temporary variables
    // memory are variables/parameters that can be modified, they are temporary variables
    // storage are variables that can be modified, they are permanent variables
    // We can not say a variable/parameter is Stack, Code or Logs
    // We only specify data locations for arrays, structs and mappings - string is array of bytes
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

// The contract is deployed on the Goerli Testnet at https://goerli.etherscan.io/address/0x6d466c7f270f5831173c834115d0636fa206c342
