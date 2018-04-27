pragma solidity ^0.4.4;


contract Pollcat {
 

   	// This is a type for a single proposal.
    struct Poll {
        bytes32 name;   // short name (up to 32 bytes)
        uint voteCount; // number of accumulated votes
    }

    // A dynamically-sized array of `Poll` structs.
    Poll[] public polls;


  	function Pollcat() public {
    	// constructor
    	polls.push(Poll({
                name: "pepsi",
                voteCount: 0
        }));
    	polls.push(Poll({
                name: "coke",
                voteCount: 0
        }));


  	}

  	//Vote for either coke or pepsi
  	function vote(uint poll) public {
        //Vote for either pepsi or coke
  		polls[poll].voteCount += 1;
  	}

  	/// @dev Computes the winning proposal taking all
    /// previous votes into account.
    function winningProposal() public view returns (uint winningProposal_)
    {
        uint winningVoteCount = 0;
        for (uint p = 0; p < polls.length; p++) {
            if (polls[p].voteCount > winningVoteCount) {
                winningVoteCount = polls[p].voteCount;
                winningProposal_ = p;
            }
        }
        //console.log("The winning num is" + winningProposal_);
    }

  	function winnerName() public view returns (bytes32)
    {
        return polls[winningProposal()].name;
    }

}
