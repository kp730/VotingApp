pragma solidity 0.5.16;

contract Election
{
    // Model a candidate
    struct Candidate
    {
        uint id;
        string name;
        uint voteCount;
    }
    // Storing and fetching candidates
    mapping(uint => Candidate) public candidates;
    // Store a list of voters
    mapping(address => bool) public voters;
    uint public candidatesCount;
    constructor () public
    {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }
    function addCandidate(string memory _name) private
    {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
    function vote(uint _candidateId) public
    {
        // Check whether the voter as already voted
        require(!voters[msg.sender], "Voter should not vote multiple times");
        // Check whether the candidate is valid
        require(_candidateId>0 && _candidateId<=candidatesCount, "Invalid candidate");
        // Record that the voter has voted
        voters[msg.sender] = true;
        // Increment the vote count for the candidate
        candidates[_candidateId].voteCount++;
    }
}