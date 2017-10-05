pragma solidity ^ 0.4.11;
// We have to specify what version of compiler this code will compile with

contract VotingContract {
    
    /* mapping field below is equivalent to an associative array or hash.
    The key of the mapping is candidate name stored as type bytes32 and value is
    an unsigned integer to store the vote count
    */
    mapping(bytes32 => uint8) public votesReceived;

    /* Solidity doesn't let you pass in an array of strings in the constructor (yet).
    We will use an array of bytes32 instead to store the list of candidates
    */
    bytes32[] public candidateList;

    /* This is the constructor which will be called once when you
    deploy the contract to the blockchain. When we deploy the contract,
    we will pass an array of candidates who will be contesting in the election
    */
    function VotingContract(bytes32[] candidateNames) payable {
        candidateList = candidateNames;
    }

    // This function returns the total votes a candidate has received so far
    function totalVotesFor(bytes32 candidate) returns(uint8) {
        require(validCandidate(candidate) == true);
        return votesReceived[candidate];
    }

    // This function increments the vote count for the specified candidate. This
    // is equivalent to casting a vote
    function voteForCandidate(bytes32 candidate) {
        require(validCandidate(candidate) == true);
        votesReceived[candidate] += 1;
    }

    // This function validates the candidate present in contestant list
    function validCandidate(bytes32 candidate) returns(bool) {
        for (uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}