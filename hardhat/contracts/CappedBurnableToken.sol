// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

/**
 * @title CappedBurnableToken
 * @dev Implementation of the CappedBurnableToken
 * This contract creates an ERC20 token with burning capability and a maximum supply cap.
 */
contract CappedBurnableToken is ERC20, ERC20Burnable, ERC20Capped {
    /**
     * @dev Constructor that gives msg.sender all of initial supply.
     * @param name_ The name of the token.
     * @param symbol_ The symbol of the token.
     * @param maxSupply_ The maximum supply of the token.
     */
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 maxSupply_
    ) ERC20(name_, symbol_) ERC20Capped(maxSupply_) {
        // No initial minting is done here.
        // Minting can be done later using the mint function.
    }

    /**
     * @dev See {ERC20-_mint}.
     *
     * Requirements:
     *
     * - the cap must not be exceeded.
     */
    function _mint(address account, uint256 amount) internal virtual override(ERC20, ERC20Capped) {
        super._mint(account, amount);
    }
}