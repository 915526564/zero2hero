
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract MyToken is Initializable {
    uint256 private constant TOTAL_SUPPLY = 1000000;
    uint256 private _balance;
    address private _owner;

    // function initialize(address owner) public initializer {
    //     _owner = owner;
    //     _balance = TOTAL_SUPPLY;
    // }

    constructor(){
        _owner=msg.sender;
    }

    function balanceOf() public view returns (uint256) {
        return _balance;
    }

    function setBalance(uint256 newBalance) public {
        require(msg.sender == _owner, "Only the owner can update the balance.");
        _balance = newBalance;
    }
}

contract MyTokenProxy is TransparentUpgradeableProxy {
    constructor(address logic, address admin, bytes memory data)
        TransparentUpgradeableProxy(logic, admin, data)
    {
    }
}
