//SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.0;


contract Whitelist{
    //max number of whitelisted address allowed
    uint8 public maxWhitelistedAddress;
    //map of whitelistaddress
    mapping(address=>bool) public whitelistedAddresses;
    //keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;
    //set the max number of whitelisted
    constructor(uint8 _maxAddressesWhitelisted){
        maxWhitelistedAddress=_maxAddressesWhitelisted;
    }
    //add the address to whitelist
    function addAddressToWhiteList()public{
        require(!whitelistedAddresses[msg.sender],"Sender has already been whitelisted");
        require(numAddressesWhitelisted<maxWhitelistedAddress,"Number limit reached");
        whitelistedAddresses[msg.sender]=true;
        numAddressesWhitelisted += 1;
    }
}
//0xFEcd2876318c1E86a5d7Ed4bA8CFF820674552C9