// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ProposalContract {
    address public owner; // Contract owner's address

    uint256 private counter;

    // Proposal structure to store proposal details
    struct Proposal {
        string title;
        string description;
        uint256 approve;
        uint256 reject;
        uint256 pass;
        uint256 total_vote_to_end;
        bool current_state;
        bool is_active;
    }

    // Mapping to store proposal history
    mapping(uint256 => Proposal) proposal_history;

    // Modifier to restrict function access to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can create proposals");
        _;
    }

    // Constructor to set the contract owner during deployment
    constructor() {
        owner = msg.sender; // Set the owner to the address that deployed the contract
    }

    // Function to create a new proposal, restricted to the owner
    function create(string calldata _title, string calldata _description, uint256 _total_vote_to_end) external onlyOwner {
        counter += 1;
        proposal_history[counter] = Proposal(_title, _description, 0, 0, 0, _total_vote_to_end, false, true);
    }
}
