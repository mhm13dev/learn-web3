// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    // Overriding a function from parent contract
    // We have 2 keywords here: virtual, override
    // To override a function from parent contract, we need to specify "virtual" modifier on that function inside parent contract
    // And specify "override" modifier on that function in the child contract
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}
